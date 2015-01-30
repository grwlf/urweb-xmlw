structure X = XMLW

val nest = @@X.nest
val push_back = @@X.push_back
val push_front = @@X.push_front
val push_back_ = @@X.push_back_
val push_front_ = @@X.push_front_
val push_back_xml = @@X.push_back_xml

fun dnest st m =
  push_back (nest (fn x=><xml><div style={st}>{x}</div></xml>) m)

fun tnest m =
  push_back (nest (fn x => <xml><table>{x}</table></xml>) m)

table a : {Id:int, S:string}

task initialize = fn _ =>
  dml(DELETE FROM a WHERE Id >= 0);
  dml(INSERT INTO a(Id,S) VALUES(0,"S1"));
  dml(INSERT INTO a(Id,S) VALUES(1,"S2"));
  dml(INSERT INTO a(Id,S) VALUES(2,"S3"));
  return {}

fun main {} : transaction page =

  b <- X.run (

    push_back_xml (<xml><h1>XMLGen test</h1></xml>);

    dnest (STYLE "background:grey") (

      push_back_xml (<xml><h2>Nested DIV</h2></xml>);

      dnest (STYLE "background:white;margin:15px") (

        push_back_xml (<xml><h2>Innermost DIV+table</h2></xml>);

        tnest (
          push_back_xml
          <xml><tr><th>ID</th><th>S</th></tr></xml>;

          X.query_ (SELECT A.Id, A.S FROM a AS A)
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

