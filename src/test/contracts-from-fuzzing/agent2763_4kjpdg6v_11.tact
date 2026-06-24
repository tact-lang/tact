struct NestedOptDefault {
  value: Int? = null;
  text: String? = null;
}

struct Enclosing {
  nested: NestedOptDefault;
}

contract OptWithDefaults {
  x: Enclosing;

  init() {
    self.x = Enclosing{
      nested: NestedOptDefault{},
    };
  }
}