struct NestedOptionals {
  aa: Int?;
  bb: Bool?;
}

contract NestedOptPersist {
  a: NestedOptionals?;
  b: NestedOptionals?;

  init() {
    self.a = null;
    self.b = NestedOptionals{aa:1,bb:null};
  }
}