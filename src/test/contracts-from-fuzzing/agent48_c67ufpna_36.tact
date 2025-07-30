struct A {
  x: Int;
}

message B {
  y: Int;
}

contract Test {
  receive() {
    let a = A{ x: 1 };
    let b = B{ y: 2 };
    let sum = a.x + b.y;
  }
}