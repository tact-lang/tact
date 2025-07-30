struct DeepNested {
  layer: NestedLevel;
}

struct NestedLevel {
  val: Int;
}

contract DeepTest {
  dn: DeepNested;

  init() {
    self.dn = DeepNested{ layer: NestedLevel{ val: 1 } };
  }
}