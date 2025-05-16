struct OptionalStruct {
  val: Int?;
}

contract TestContract {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct{ val: null };
  }
}