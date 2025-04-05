struct Person {
  name: String;
}

struct Employee {
  person: Person;
  id: Int;
}

contract Test {
  receive() {
    let a: Int = 1;
  }
}