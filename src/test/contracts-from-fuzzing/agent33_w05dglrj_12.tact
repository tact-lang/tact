message MessageA {
    value: Int;
}

message MessageB {
    messageA: MessageA;
}

contract MessageContract {
    receive(msg: MessageB) {
        let x = msg.messageA.value;
    }
}
