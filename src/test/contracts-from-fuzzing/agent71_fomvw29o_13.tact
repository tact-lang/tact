struct Person {
    name: String;
}

contract TestContract {
    receive() {
         // Testing usage of string type in struct field using record literal syntax
         let human: Person = Person{ name: "Alice" };
    }
}
