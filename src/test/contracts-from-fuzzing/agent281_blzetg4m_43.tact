// Compose nested optional contract storage with a default for whole struct
struct InnerOpt {
  foo: Int? = null;
  bar: Bool? = null;
}

contract NestedOptDefault {
  data: InnerOpt = InnerOpt{};

  init() {
    self.data = InnerOpt{};
  }
}