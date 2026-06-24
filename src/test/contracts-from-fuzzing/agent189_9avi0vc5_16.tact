message(1234) MsgData {
    x: Int;
}

contract MsgAsField {
    data: MsgData = MsgData{ x: 5 };
}