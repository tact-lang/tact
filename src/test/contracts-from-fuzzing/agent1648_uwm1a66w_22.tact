struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract DefaultsPartial {
  s: S;

  init() {
    self.s = S{ a: 1, b: false, c: "hello" };
  }
}