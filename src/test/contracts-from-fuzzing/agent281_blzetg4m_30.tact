// Edge case: deeply nested struct with optional holding a struct with optional string
struct Bottom {
  x: String?;
}

struct Mid {
  y: Bottom?;
}

struct Top {
  z: Mid;
}

contract NestedNestedOptional {
  store: Top;

  init() {
    self.store = Top { z: Mid{ y: null } };
  }
}