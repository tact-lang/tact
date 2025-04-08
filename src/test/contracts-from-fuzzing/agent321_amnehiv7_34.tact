struct Su {
  a: Int?;
}

contract OptionalAssign {
  s: Su;

  init() {
    self.s = Su{ a: null };
  }
}