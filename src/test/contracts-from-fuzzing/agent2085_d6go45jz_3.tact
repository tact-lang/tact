struct OptNested {
  nested: Nested?;
}

struct Nested {
  value: Int;
}

contract TestContract {
  data: OptNested;

  init() {
    self.data = OptNested{
      nested: Nested{value: 42}
    };
  }
}