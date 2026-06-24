struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract ParamsVsInit {
  val: S;

  init() {
    self.val = S{ a: 1, b: true, c: "foo" };
  }
}