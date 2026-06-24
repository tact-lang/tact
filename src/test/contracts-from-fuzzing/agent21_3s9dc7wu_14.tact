struct A { x: Int }
message B { y: A }
message C { z: B }

contract Test {
  receive(m: C) {}
}