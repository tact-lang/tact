struct MyStruct {
  a: Int;
  b: Bool;
}

fun make_my_struct() : MyStruct {
  return MyStruct {
    a: 1,
    b: true
  };
}

contract Test {
  receive() {
    let s = make_my_struct();
  }
}