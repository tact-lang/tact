struct S {
  a: Int;
}

message M {
  b: Int;
}

struct Wrapper {
  s: S;
  m: M;
}

contract Test {
  receive() {
    // mixing struct and message inside struct
  }
}