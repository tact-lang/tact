contract Test {
  receive() {
    let msg = context();
    let value: Int = msg.value;
  }
}