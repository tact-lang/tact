struct Layer1 {
  field: Layer2;
}

struct Layer2 {
  val: Int;
}

contract NestedLayers {
  nested: Layer1;

  init() {
    self.nested = Layer1{
      field: Layer2{val:42}
    };
  }
}
