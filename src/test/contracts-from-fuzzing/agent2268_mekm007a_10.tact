contract DefaultsOpt {
  x: Int?;
  y: Bool? = null;
  s: String? = null;
  c: Cell? = null;
  a: Address? = null;

  init() {
    self.x = null;
  }
}