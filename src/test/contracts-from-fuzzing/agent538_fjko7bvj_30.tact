struct Opts {
  x: Int?;
  s: String?;
}

contract OptionalDefaults {
  data: Opts;

  init() {
    self.data = Opts{
      x: null,
      s: null
    };
  }
}
