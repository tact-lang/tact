struct NestedWithOptional {
  val: Int?;
}

struct Container {
  nested: NestedWithOptional;
}

contract NestedOptField {
  c: Container;

  init() {
    self.c = Container { nested: NestedWithOptional{ val:null } };
  }
}