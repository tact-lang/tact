struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract ManyPrimitives {
  i: Int;
  b: Bool;
  s: String;
  nested: S;

  init() {
    self.i = 42;
    self.b = true;
    self.s = "ok";
    self.nested = S{a:1, b:false, c:"c"};
  }
}