struct OptionalNestedStruct {
  inside: PrimitiveOptionals?;
}

contract NestedOptContract {
  data: OptionalNestedStruct;

  init() {
    self.data = OptionalNestedStruct{ inside: null };
  }
}

struct PrimitiveOptionals {
  a: Int?;
  b: Bool?;
}