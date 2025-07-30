struct Leaf {
  foo: Int = 100;
  bar: Bool;
}

struct Container {
  leaf: Leaf;
}

contract DeepDefaults {
  data: Container;

  init() {
    self.data = Container{ leaf: Leaf{ bar: true } };
  }
}
