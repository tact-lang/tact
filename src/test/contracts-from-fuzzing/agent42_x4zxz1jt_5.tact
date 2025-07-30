struct A {
  value: Int
}

message B {
  inner: A
}

contract Test {
    receive() {
        // do nothing
    }
}