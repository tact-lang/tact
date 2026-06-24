struct NestedOpt {
  x: Int?;
}

contract Test {
  receive() {
    let y: NestedOpt = NestedOpt{x: null};
  }
}