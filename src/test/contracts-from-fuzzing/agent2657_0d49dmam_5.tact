struct Inner {
  value1: String;
  value2: Bool?;
}

contract NestedOptional {
  val: Int = 1;
  optStruct: Inner? = null;

  init() {
    self.optStruct = Inner{ value1: "opt", value2: true };
  }
}
