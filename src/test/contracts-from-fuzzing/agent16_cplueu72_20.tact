message A {
  n: Int;
}

struct B {
  x: Int;
}

contract Test {
  receive(msg: A) {
    let x = msg.n;
  }
}

contract Test2 {
  receive() {
    let b: B = B{ x: 3 };
  }
}