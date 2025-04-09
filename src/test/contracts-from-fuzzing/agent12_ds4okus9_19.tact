message HasOptional {
  a: Int?;
}

contract Test {
  receive(msg: HasOptional) {
    // test optional field
  }
}