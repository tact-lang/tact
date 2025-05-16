struct OneField {
  x: Int;
}

contract Test {
  receive() {
    let a = OneField{x: 5};
    let b = a;
    b.x = 10;
  }
}