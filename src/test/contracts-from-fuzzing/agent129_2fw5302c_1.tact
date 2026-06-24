struct NestedStruct {
  a: Int;
  b: Bool?;
  c: String;
}

contract TestContract {
  value: NestedStruct;

  init() {
    self.value = NestedStruct{
      a: 1,
      b: true,
      c: "hello"
    };
  }
}