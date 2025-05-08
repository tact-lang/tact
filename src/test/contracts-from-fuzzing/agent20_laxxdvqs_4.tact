message InnerMessage {
    value: Int;
}

message OuterMessage {
    inner: InnerMessage;
}

contract Test {
    receive(msg: OuterMessage) {
    }
}