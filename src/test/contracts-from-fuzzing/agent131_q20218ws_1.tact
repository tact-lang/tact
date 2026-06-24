struct InnerStruct {
  x: Int;
  y: Int?;
}

contract NestedFieldsTest {
  coords: InnerStruct;
  flag: Bool;

  init() {
    self.coords = InnerStruct{ x: 1, y: null };
    self.flag = true;
  }
}