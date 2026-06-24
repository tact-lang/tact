fun greet(): String {
  return "Hello Tact!";
}

contract Test {
    receive() {
        greet();
    }
}