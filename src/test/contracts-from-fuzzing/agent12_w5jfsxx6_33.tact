struct InnerMsg {
    z: Int?;
}

message(1234) MsgWithStruct {
    i: Int;
    s: InnerMsg?;
}

contract MsgHolder {
    lastMsg: MsgWithStruct?;
}