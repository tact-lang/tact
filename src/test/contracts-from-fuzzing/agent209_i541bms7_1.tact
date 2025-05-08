struct NestedLevel2 {
  leaf: Int;
}

struct NestedLevel1 {
  branch: NestedLevel2;
}

contract DeepNestTest {
  root: NestedLevel1;

  init() {
    self.root = NestedLevel1{
      branch: NestedLevel2{leaf: 123}
    };
  }
}