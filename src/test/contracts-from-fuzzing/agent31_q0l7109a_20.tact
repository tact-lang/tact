contract Test {
  receive() {
    let msg: Address = sender();
  }
}