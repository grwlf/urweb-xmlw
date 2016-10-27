{libraries ? {}} :

let

  uwb = (import <urweb-build>) { inherit libraries; };

in with uwb;

rec {

  xmlw = mkLib {

    name = "XMLW";

    libraries = {
      monad-pack = thirdparty ./lib/urweb-monad-pack;
    };

    statements = [
      (sys "list")
      (sys "char")
      (sys "string")
      (src1 ./XMLW.ur)
    ];
  };

  xmlw-test =
    mkExe {
      name = "XMLWTest";
      dbms = "sqlite";

      libraries = {
        inherit xmlw;
      };

      statements = [
        (sys "list")
        (sys "char")
        (sys "string")
        (src1 ./test/XMLW1.ur)
      ];
    };
}



