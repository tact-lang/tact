message TestMessage {
    value: Int;
}

message AnotherMessage {
    value: Int;
}

contract TestContract {
    receive(msg: TestMessage) {
    }
}