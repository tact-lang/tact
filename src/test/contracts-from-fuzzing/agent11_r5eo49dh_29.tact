struct Outer {
  value: Int;
}

message Inner {
  nested: Outer;
}

contract Test {
  receive(message: Inner) {
    return;
  }
}