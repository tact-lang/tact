struct Opts {
  a: Int?;
  b: Bool?;
}

contract OptionalPrimitives {
  f1: Int?;
  f2: Bool?;
  f3: Cell?;
  f4: String?;
  f5: Address?;
  s: Opts;

  init() {
    self.f1 = null;
    self.f2 = null;
    self.f3 = null;
    self.f4 = null;
    self.f5 = null;
    self.s = Opts{ a: null, b: null };
  }
}
