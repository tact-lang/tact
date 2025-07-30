// optional of many field struct as contract persistent
struct Many {
  a:Int;
  b:Int;
  c:Int;
  d:Int;
  e:Int;
  f:Int;
  g:Int;
}

contract Test {
  field: Many? = null;
}