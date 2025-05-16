struct MyStruct {
  a: Int;
  b: Bool;
}

contract TypeTest {
  receive() {
    let s: MyStruct? = null;
  }
}