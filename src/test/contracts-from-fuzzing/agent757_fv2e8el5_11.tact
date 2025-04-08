struct TinyOpt {
  a: Int?;
}

contract NullableField {
  state: TinyOpt;

  init() {
    self.state = TinyOpt{ a: null };
  }
}