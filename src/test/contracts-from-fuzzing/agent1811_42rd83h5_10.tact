struct OptionalStruct {
  s: Inner?;
}

struct Inner {
  val1: Int;
  val2: Bool;
}

contract TestOptionalStruct {
  optionalS: OptionalStruct;

  init() {
    self.optionalS = OptionalStruct{
      s: null
    };
  }
}
