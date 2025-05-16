struct Person {
  name: String;
  age: Int;
}

contract Test {
  receive() {
    let p: Person = Person { name: "Alice", age: 30 };
  }
}