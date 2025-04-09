struct Layer2 {
  x: Int;
  y: Int?;
}

struct Layer1 {
  val: Int;
  nested: Layer2;
  opt_nested: Layer2?;
}

contract NestedOptionalStructs {
  top: Layer1;

  init() {
    self.top = Layer1{
      val: 11,
      nested: Layer2{ x: 22, y: null },
      opt_nested: null
    };
  }
}