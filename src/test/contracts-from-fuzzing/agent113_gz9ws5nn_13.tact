struct OptString {
  val: String?;
}

contract ContractOptString {
  f: OptString;

  init() {
    self.f = OptString{val: null};
  }
}