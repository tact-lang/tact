fun Greet(): String {
  return "Hello Tact";
}

contract Test {
  receive() {
    let greeting = Greet();
  }
}
