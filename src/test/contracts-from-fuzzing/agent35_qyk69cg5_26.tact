struct Person {
  name: String;
}

contract Test {
  receive() {
    let p = Person{name: "Alice"};
  }
}