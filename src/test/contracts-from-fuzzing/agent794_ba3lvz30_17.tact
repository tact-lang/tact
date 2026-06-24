struct MyStruct {
  x: Int;
  y: Bool;
}

contract OptionalStructVar {
  data: MyStruct?;

  init() {
    self.data = null;
  }
}
