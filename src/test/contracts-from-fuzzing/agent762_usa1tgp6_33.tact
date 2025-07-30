struct OptIntDefault {
  v: Int?;
}

contract OptionalStructDefaultNull {
  f: OptIntDefault;

  init() {
    self.f = OptIntDefault{ v: null };
  }
}