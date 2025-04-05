message ReservedWords {
  int: Int;
}

contract Test {
  receive() {
    let r: ReservedWords = ReservedWords{int: 5};
  }
}