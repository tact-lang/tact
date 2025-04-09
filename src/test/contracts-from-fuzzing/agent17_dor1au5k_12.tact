struct S {
  x: Int
}

fun makeS(x: Int): S {
  return S { x: x };
}

contract Test {
  receive() {
    let s = makeS(10);
  }
}