message InternalMessage {
    value: Int;
}

message ExternalMessage {
    value: Int;
}

contract TestContract {
    receive(msg: InternalMessage) {
        let x = msg.value;
    }

    receive(msg: ExternalMessage) {
        let y = msg.value;
    }
}