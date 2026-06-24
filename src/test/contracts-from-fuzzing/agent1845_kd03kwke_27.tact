// Wide contract: many fields, mixed types, no nesting
contract WideMix {
  a: Int;
  b: Bool;
  c: Bool?;
  d: Int?;
  e: Bool?;
  f: Int;
  g: Bool;
  h: Int?;
  i: Bool?;
  j: Int;
  k: Bool;

  init() {
    self.a=1; self.b=true; self.c=null; self.d=null; self.e=null;
    self.f=5; self.g=true; self.h=null; self.i=null; self.j=10; self.k=false;
  }
}
