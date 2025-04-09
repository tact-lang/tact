message(0x9) MsgA {}
message(0xA) MsgB {}

struct BothMsgsOpt {
    ma: MsgA?;
    mb: MsgB?;
}

contract TestOptMsgs {
    data: BothMsgsOpt;

    init() {
        self.data = BothMsgsOpt{
            ma: null,
            mb: null
        };
    }
}
