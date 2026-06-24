struct InnerStruct {
  flag: Bool;
  count: Int;
}

contract NestedStructTest {
  nestedData: InnerStruct;

  init() {
    self.nestedData = InnerStruct{flag: true, count: 10};
  }
}