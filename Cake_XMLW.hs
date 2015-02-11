
module Cake_XMLW where

import Development.Cake3
import Development.Cake3.Ext.UrWeb

import qualified Cake_MonadPack as MonadPack

import Cake_XMLW_P

lib = do
  uwlib (file "lib.urp") $ do
    library MonadPack.lib
    ur (file "XMLW.ur")

mktest f bdy = do
  uwapp "-dbms sqlite" (f .= ".urp") $ do
    database ("dbname="++(takeBaseName f))
    sql (f.="sql")
    library lib
    ur (sys "list")
    ur (sys "char")
    ur (sys "string")
    bdy
    ur f

demo = mktest (file "test/XMLW1.ur") (return ())

main = do
  writeMake (file "Makefile") $ do
    rule $ do
      phony "lib"
      depend lib
    rule $ do
      phony "all"
      depend demo

