// optional message inside a struct field
message(101) MsgA {
    val: Int;
}

struct HoldsMsg {
    m: MsgA?;
    text: String = "X";
}

contract OptMsgStruct {
    holder: HoldsMsg;

    init() {
        self.holder = HoldsMsg{
            m: null,
            text: "ok",
        };
    }
}
