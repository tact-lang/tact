struct NestedOptionals {
  a: Int?;
  b: Bool?;
}

struct HasNestedOptionals {
  nested: NestedOptionals?;
}

contract DeepOptional {
  data: HasNestedOptionals;

  init() {
    self.data = HasNestedOptionals{ nested: null };
  }
}
