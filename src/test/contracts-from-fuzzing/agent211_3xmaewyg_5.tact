struct NestedOptStruct {
  x: Int;
  y: Bool?;
}

contract NestedOptStorage {
  data: NestedOptStruct;

  init() {
    self.data = NestedOptStruct{
      x: 42,
      y: null,
    };
  }
}
