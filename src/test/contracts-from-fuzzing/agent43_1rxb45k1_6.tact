struct S { x: Int }

message M { s: S }

contract Test {
  receive(msg: M) {
    // message with struct field
  }
}