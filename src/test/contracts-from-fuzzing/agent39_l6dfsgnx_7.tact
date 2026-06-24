struct Data {
    value: Int;
}

message Msg {
    info: Data;
}

contract Test {
    receive(message: Msg) {
        // use message.info.value
    }
}