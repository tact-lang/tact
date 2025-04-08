struct S {
  x: Int?;
}

contract OptionalOfOptional {
  opt: S?;

  init() {
    self.opt = null;
  }
}