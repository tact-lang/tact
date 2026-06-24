contract PrimitiveVariants {
  i: Int;
  b: Bool;
  s: String;
  oi: Int?;
  ob: Bool?;
  os: String?;

  init() {
    self.i=1; self.b=true; self.s="a";
    self.oi=null; self.ob=false; self.os=null;
  }
}