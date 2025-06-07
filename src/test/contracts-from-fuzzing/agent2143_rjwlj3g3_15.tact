struct Container {
  nested: InnerStruct;
}

struct InnerStruct {
  foo: Int;
  bar: String;
}

contract StorageOrderTest {
  container: Container;

  init() {
    self.container = Container{nested: InnerStruct{foo: 99, bar: "abc"}};
  }
}