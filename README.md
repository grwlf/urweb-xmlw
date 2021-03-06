XMLW
====

XMLW is an [Ur/Web](http://hg.impredicative.com/ur/) library defining a monadic
XML accumulator. It allows programmer to mix XML code and transactional logic in
a single Writer-like monad.


Installing
----------

This project depends on some git submodules, so the typical install sequence
would be:

    $
    git clone https://github.com/grwlf/urweb-xmlw
    cd urweb-xmlw
    git submodule update --init --recursive
    make


The Makefile builds _./lib.urp_ and certain tests in _test/_ folder.

Example
-------

In the following example, the database query code is located very close to the
place we render it's result. We no longer need to separate transactional actions
from purely-functonal XML producer.

    fun dnest st m =
      push_back (nest (fn x=><xml><div style={st}>{x}</div></xml>) m)

    fun tnest m =
      push_back (nest (fn x => <xml><table>{x}</table></xml>) m)


    fun main {} : transaction page =

      b <- run (

        push_back_xml (<xml><h1>XMLGen test</h1></xml>);

        dnest (STYLE "background:grey") (

          push_back_xml (<xml><h2>Nested DIV</h2></xml>);

          dnest (STYLE "background:white;margin:15px") (

            push_back_xml (<xml><h2>Innermost DIV+table</h2></xml>);

            tnest (
              push_back_xml
              <xml><tr><th>ID</th><th>S</th></tr></xml>;

              lift (debug "Lifting monad transactional works well");

              query_ (SELECT A.Id, A.S FROM a AS A)
              (fn r =>
                push_back_xml
                <xml><tr><td>{[r.A.Id]}</td><td>{[r.A.S]}</td></tr></xml>
              )
            )
          )
        )
      );
      return
      <xml><head/><body>{b}</body></xml>

