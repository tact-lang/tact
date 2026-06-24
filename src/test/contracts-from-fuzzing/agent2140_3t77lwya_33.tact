struct A { x: Int; y: String; z: Bool; }
contract HugePrims {
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
  sa: A;
  init() {
    self.a=1; self.b=2; self.c=3; self.d=4; self.e=5; self.f=6; self.g=7; self.h=8; self.i=9; self.j=10;
    self.sa = A{ x:11, y:"twelve", z:true };
  }
}
