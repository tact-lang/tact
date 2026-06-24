// test optional message nested inside struct field used in contract storage
message(0x1234AAAA) InnerMessage {
    foo: Int;
}

struct WrapMsgOpt {
    im: InnerMessage?;
}

contract OptMsgInStorage {
    wrap: WrapMsgOpt;

    init() {
        self.wrap = WrapMsgOpt { im: null };
    }
}
