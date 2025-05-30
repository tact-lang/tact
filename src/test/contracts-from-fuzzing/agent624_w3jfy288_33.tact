message(0x1234) InfoMsg {
    id: Int;
    flag: Bool;
}

contract ParamOfMsgStruct(
    info: InfoMsg,
) {}