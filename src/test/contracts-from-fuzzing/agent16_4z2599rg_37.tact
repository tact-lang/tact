struct OptMix {
  a:Int?=null;
  b:Int?=null;
  c:Int?=null;
  d:Int?=null;
  e:Int?=null;
  f:Int?=null;
  g:Int?=null;
  h:Int?=null;
  i:Int?=null;
  j:Int?=null;
}

contract Test {
  m: OptMix = OptMix{
    a: 1, b: null, c: 3, d: null, e: 5,
    f: null, g: 7, h: null, i: 9, j: null
  };

  init() {}
}