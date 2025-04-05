contract Test {
  receive() {
    let t = ton("9223372036854775808"); // 2^63
  }
}