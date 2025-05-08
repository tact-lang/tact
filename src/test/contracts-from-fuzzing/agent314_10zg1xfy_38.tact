// nested multiple layers with optionals and default values
struct Inn {
  x: Int?;
  y: Bool = false;
}

struct Out {
  inn: Inn?;
  name: String = "default";
}

contract NestedLayered {
  val: Out?;
  init() {
    self.val = null;
  }
}