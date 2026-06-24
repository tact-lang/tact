fun f(): Int {
  let a: Int = 1 + + 2;
  return a;
}

contract Test {
  receive() { f(); }
}
