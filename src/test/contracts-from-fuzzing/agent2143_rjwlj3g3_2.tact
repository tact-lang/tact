struct DeepNested {
  innerVal: Int;
  innerFlag: Bool;
}

struct Container {
  nested1: DeepNested;
  nested2: DeepNested;
}

contract DeepNestedStorageTest {
  container: Container;

  init() {
    self.container = Container{
      nested1: DeepNested{innerVal: 1, innerFlag: true},
      nested2: DeepNested{innerVal: 2, innerFlag: false}
    };
  }
}