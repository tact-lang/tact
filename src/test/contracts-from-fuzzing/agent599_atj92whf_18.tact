message(0xAAA) InnerMsg { val: Int; }

struct Holder {
    im: InnerMsg?;
}

contract OptionalMsgField {
    s: Holder;
    init() {
        self.s = Holder{im: null};
    }
}