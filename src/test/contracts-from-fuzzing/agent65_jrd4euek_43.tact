struct Wrapped {
  val: Int;
}

contract ContractOptWrap {
  field: Wrapped?;
  init() {
    self.field = null;
  }
}