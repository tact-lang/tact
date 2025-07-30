struct SubData {
  str: String?;
  data: Cell?;
}

struct Container {
  content: SubData?;
  extra: String?;
}

contract NestedHeapTypes {
  state: Container;

  init() {
    self.state = Container {
      content: null,
      extra: null
    };
  }
}