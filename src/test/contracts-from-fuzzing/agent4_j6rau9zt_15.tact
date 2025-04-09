struct MsgAsStructField {
    nested: SomeMessage
}

message SomeMessage {
    value: Int
}

contract Test {
    receive() {
        // do nothing
    }
}