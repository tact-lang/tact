struct OnlyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract NullableAllPersistent {
  state: OnlyOptionals;

  init() {
    self.state = OnlyOptionals{ a: null, b: null, c: null };
  }

  receive() {
    let ca = self.state.a;
    let cb = self.state.b;
    let cc = self.state.c;
  }
}
