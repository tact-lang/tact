struct NestedStruct {
  x: Int;
  y: Int;
}

contract SingleSimpleField {
  coord: NestedStruct;

  init() {
    self.coord = NestedStruct{ x: 5, y: 6 };
  }
}