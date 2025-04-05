message AllowedSymbols_123 {
  x: Int;
}

contract Test {
  receive(msg: AllowedSymbols_123) {
    let q = msg.x;
  }
}