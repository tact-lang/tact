struct OptionalNestedStruct {
  child: Nested?
}

struct Nested {
  val: Int;
  text: String;
}

contract TestOptionalNestedStruct {
  data: OptionalNestedStruct;
  init() {
    self.data = OptionalNestedStruct{
      child: null
    };
  }
}
