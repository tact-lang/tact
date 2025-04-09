struct NestedOpt {
  x: Int?;
}

message WrapOpt {
  n: NestedOpt?;
}

contract Test {
  receive() {
    WrapOpt{n: null};
  }
}