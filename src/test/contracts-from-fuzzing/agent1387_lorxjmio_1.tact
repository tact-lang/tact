struct MyStruct {
  x: Int;
  y: Int;
  flag: Bool;
}

contract TestContract {
  data: MyStruct;

  init() {
    self.data = MyStruct{ x: 1, y: 2, flag: true };
  }
}