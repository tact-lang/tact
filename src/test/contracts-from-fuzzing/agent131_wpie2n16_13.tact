message MyMessage {
    value: Int;
}

message AnotherMessage {
    data: String;
}

contract Test {
    receive(msg: MyMessage) {
        // handler for MyMessage
    }
    receive(msg: AnotherMessage) {
        // handler for AnotherMessage
    }
}
