message(0x10) Msg1 { v: Int }
message(0x11) Msg2 { s: String }

struct WrapMsgs {
    m1: Msg1;
    m2: Msg2;
}

contract MsgAsStructField {
    w: WrapMsgs = WrapMsgs{ m1: Msg1{ v: 1 }, m2: Msg2{ s: "hi" } };
}