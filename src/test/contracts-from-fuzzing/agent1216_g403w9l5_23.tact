struct InnerStruct {
  x: Int;
}

contract StructAndPrimitive {
  data: InnerStruct;
  flag: Bool;

  init() {
    self.data = InnerStruct{ x:5 };
    self.flag = true;
  }
}