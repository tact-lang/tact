message M1 { a: Int }
message M2 { b: M1 }

struct S { x: M2 }

contract Test {
  receive() {}
}