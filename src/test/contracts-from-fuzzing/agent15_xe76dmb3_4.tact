struct A {
  x: Int
}

struct B {
  y: A
}

struct C {
  z: B
}

contract Test {
  receive() {}
}