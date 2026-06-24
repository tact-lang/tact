message(0x42) MsgData {
    foo: Int;
    comment: String?;
    valid: Bool;
}

contract TestContract {
    info: MsgData = MsgData{
        foo: 5,
        comment: null,
        valid: true,
    };

    init() {}

    receive() {}
}