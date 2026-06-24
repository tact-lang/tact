struct NestedStruct {
  a: Int;
  b: Bool;
}

contract TestStorage {
  data: NestedStruct;

  init() {
    self.data = NestedStruct{a: 1, b: true};
  }
}