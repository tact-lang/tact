struct S {
  a: Int;
  b: Bool;
}

contract OptionalStructContract {
  s: S? = null;
  flag: Bool = true;

  init() {
    self.s = S{a: 7, b: false};
    self.flag = false;
  }
}