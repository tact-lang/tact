struct OptionalStruct {
  optStruct: InnerStruct?;
}

struct InnerStruct {
  foo: Int;
}

contract TestContract {
  item: OptionalStruct;

  init() {
    self.item = OptionalStruct{ optStruct: null };
  }
}