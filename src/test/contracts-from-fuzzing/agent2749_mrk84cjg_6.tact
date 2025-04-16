struct NestedOptional {
  x: Int?;
  y: String?;
}

struct Container {
  data: NestedOptional?;
}

contract OptInStruct {
  nested: Container;
  init() {
    self.nested = Container{ data: null };
  }
}