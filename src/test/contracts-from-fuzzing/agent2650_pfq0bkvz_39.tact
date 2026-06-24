contract Foo {
  a: Int;
  b: Int as uint4;
  c: Bool;
  d: String;

  init() {
    self.a = -100;
    self.b = 7;
    self.c = true;
    self.d = "zzz";
  }
}