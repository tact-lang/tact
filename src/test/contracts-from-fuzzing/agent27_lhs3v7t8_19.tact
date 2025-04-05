message A {
  b: Int;
}

message B {
  c: A;
}

message C {
  d: B;
}

contract Test {
  receive(m: C) {
    let x = m.d.c.b;
  }
}