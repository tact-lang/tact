message(999) SendMe {
    x: Int;
    y: Int;
}

contract MsgInParams(
    initMsg: SendMe,
) {
    receive() {}
}