message InnerMessage {
    value: Int;
}

message OuterMessage {
    inner: InnerMessage;
}

contract MessageContract {
    receive(msg: OuterMessage) {
    }
}