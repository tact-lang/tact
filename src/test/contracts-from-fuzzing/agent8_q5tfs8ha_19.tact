struct MyStruct {
  x: Int;
  y: Bool;
}

fun make(): MyStruct {
  return MyStruct{ x: 5, y: false };
}

contract Test {
  receive() {
    let a = make();
  }
}