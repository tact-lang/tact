struct SOpt {
  x: Int? = null;
  y: Bool? = null;
}

contract DefaultOptionalStruct {
  val: SOpt;

  init() {
    self.val = SOpt{};
  }
}