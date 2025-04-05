message MyMessage {
    value: Int;
}

fun modifyMessage(msg: MyMessage): MyMessage {
    return MyMessage{value: msg.value + 1};
}

contract TestContract {
    receive(msg: MyMessage) {
        let newMsg = modifyMessage(msg);
    }
}