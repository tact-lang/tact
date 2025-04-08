message(0x1234) MsgData {
    key: Int;
    flag: Bool;
}

struct Wrap {
    m: MsgData;
}

contract TestContract {
    w: Wrap = Wrap{ m: MsgData{ key: 42, flag: true } };
    init() {}
}