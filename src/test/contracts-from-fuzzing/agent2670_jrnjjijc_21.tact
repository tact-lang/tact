struct BigOptional {
  s: String?;
  n: Int?;
  b: Bool?;
}

contract NullAll {
  f: BigOptional;

  init() {
    self.f = BigOptional{ s: null, n: null, b: null };
  }
}