struct MyStruct {
  a: Int;
  b: Bool;
}

contract TypeTest {
  receive() {
    let s: MyStruct = MyStruct { a: 5, b: true };
  }
}