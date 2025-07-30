message Person {
    name: String;
    age: Int;
}

message Car {
    model: String;
}

contract Test {
    receive(msg: String) {
        // no usage
    }
}