message(0xABCDEF) MsgX {
    foo: Int = 5;
}

struct MixedInner {
    x: Int = 2;
    y: Bool = true;
    m: MsgX = MsgX{};
}

contract StructWithMsgField {
    mix: MixedInner = MixedInner{};
}