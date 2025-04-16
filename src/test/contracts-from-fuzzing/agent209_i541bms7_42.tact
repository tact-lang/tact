// Struct with a bool default value in nested field
struct InnerBool {
  b: Bool = true;
}

contract BoolDefaultNested {
  data: InnerBool;

  init() {
    self.data = InnerBool{};
  }
}