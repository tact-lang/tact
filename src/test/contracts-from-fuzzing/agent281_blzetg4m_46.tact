// Compose chain with nested optional defaults + explicit nulls
struct AtBottom { f: Int? = null; }
struct MidLevel { bottom: AtBottom = AtBottom{}; }
struct Root { mid: MidLevel = MidLevel{}; }

contract DeepNestedOptDef {
  data: Root;
  init() {
    self.data = Root{};
  }
}