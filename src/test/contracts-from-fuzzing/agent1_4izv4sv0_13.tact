struct MyStruct {
  a: Int;
  b: Bool;
}

contract Test {
  receive() {
    let x = MyStruct{a: 1, b: true};
  }
}