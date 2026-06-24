message ExternalMessage {
    value: Int;
}

contract TestContract {
    receive(msg: ExternalMessage) {
        let x = msg.value;
    }
}