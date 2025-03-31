fun greet(): String {
  return "Hello Tact!\n";
}

contract Test {
    receive() {
        greet();
    }
}