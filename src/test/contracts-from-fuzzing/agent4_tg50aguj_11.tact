struct S {
  x: Int
}

fun makeS(): S {
  return S { x: 12 };
}

contract Test {
  receive() {
    let s = makeS();
  }
}