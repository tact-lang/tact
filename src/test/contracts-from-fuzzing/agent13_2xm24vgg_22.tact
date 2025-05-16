message NestedDefaults {
  a: Int = 1;
  b: Int;
}

contract Test {
  receive() {
    NestedDefaults{b: 5};
  }
}