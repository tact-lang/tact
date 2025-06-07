struct NestedOptional {
  field1: Int;
  sub: SubStruct?;
}

struct SubStruct {
  flag: Bool;
  maybeString: String?;
}

contract NestedOptTest {
  state: NestedOptional;

  init() {
    self.state = NestedOptional{
      field1: 10,
      sub: SubStruct{
        flag: false,
        maybeString: null
      }
    };
  }
}