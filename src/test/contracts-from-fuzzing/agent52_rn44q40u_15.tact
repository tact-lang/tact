message A {
  val: Int;
}

struct S {
  a: A;
}

contract Test {
  receive(msg: A) {
    let s = S { a: msg };
  }
}