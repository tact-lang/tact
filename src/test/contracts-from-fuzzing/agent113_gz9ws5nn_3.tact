struct NestedOptional {
  data: OptionalStruct?;
}

struct OptionalStruct {
  flag: Bool;
  count: Int;
}

contract TestNestedOptional {
  state: NestedOptional;

  init() {
    self.state = NestedOptional{
      data: null
    };
  }
}