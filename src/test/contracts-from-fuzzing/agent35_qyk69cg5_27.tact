message Greeting {
  text: String;
}

contract Test {
  receive() {
    let g = Greeting{text: "Hi"};
  }
}