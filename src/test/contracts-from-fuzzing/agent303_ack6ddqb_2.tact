struct Nested {
  innerInt: Int;
  innerBool: Bool;
}

struct Wrapper {
  nested: Nested;
  optNested: Nested?;
  someStr: String;
}

contract DeepTest {
  field: Wrapper;
  init() {
    self.field = Wrapper{
      nested: Nested{ innerInt: 1, innerBool: false },
      optNested: null,
      someStr: "hello"
    };
  }
}
