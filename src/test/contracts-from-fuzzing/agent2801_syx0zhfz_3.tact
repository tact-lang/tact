struct SOpt {
  a: Address? = null;
}

contract OptionalAddress {
  s: SOpt;

  init() {
    self.s = SOpt{};
  }
}