struct ManyBool {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
  h: Bool;
}

contract BoolPack {
  val: ManyBool;

  init() {
    self.val = ManyBool{ a:true, b:false, c:true, d:false, e:true, f:true, g:false, h:true };
  }
}
