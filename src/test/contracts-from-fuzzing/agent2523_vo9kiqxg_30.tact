// test serialized primitives conflict with optionals
contract SerialOpts {
  a: Int as uint32;
  b: Int?;
  c: Bool;
  d: String;
  init() {
    self.a=7; self.b=null; self.c=true; self.d="str";
  }
}
