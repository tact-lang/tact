struct WithOptional {
  x: Int?
}

contract Test {
  receive() {
    let w = WithOptional{x: null};
  }
}