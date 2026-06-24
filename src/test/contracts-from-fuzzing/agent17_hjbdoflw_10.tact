contract Test {
  receive() {
    let msg = context();
    send(SendParameters{to: msg.sender, value: 1, mode: 1, body: null});
  }
}