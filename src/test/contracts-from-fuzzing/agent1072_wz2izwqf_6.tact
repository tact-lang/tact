struct BigFlat {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
  g: Int;
  h: Int;
  i: Int;
  j: Int;
  k: Int;
  l: Int;
}

contract LargeStructTest {
  payload: BigFlat;

  init() {
    self.payload = BigFlat{
      a:0,b:0,c:0,d:0,e:0,f:0,g:0,h:0,i:0,j:0,k:0,l:0
    };
  }
}
