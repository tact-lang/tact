struct Wrap {
  inner: Int?;
}

contract OptionalUpdate {
  w: Wrap = Wrap{ inner: null };

  init() {
    self.w = Wrap{
      inner: 42
    };
  }
}