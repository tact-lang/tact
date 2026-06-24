message(99) MessageX { bar: Int }

struct OptionalMsgWrap {
    m: MessageX?;
}

contract OptionalMsgField {
    msgWrap: OptionalMsgWrap;

    init() {
        self.msgWrap = OptionalMsgWrap{ m: null };
    }
}