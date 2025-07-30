message Person {
  age: Int;
  name: String;
}

contract Test {
  receive() {
    Person{age: 30, name: "Alice"};
  }
}