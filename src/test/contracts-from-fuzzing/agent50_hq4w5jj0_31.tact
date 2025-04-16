message Person {
    name: String;
    age: Int;
}

contract Test {
    receive(p: Person) {
        // no usage
    }
}