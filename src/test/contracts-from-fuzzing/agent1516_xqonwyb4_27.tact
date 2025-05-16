struct EmptyOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptDefaults {
  s: EmptyOpt;

  init() {
    self.s = EmptyOpt{
      a: null,
      b: null,
      c: null
    };
  }
}