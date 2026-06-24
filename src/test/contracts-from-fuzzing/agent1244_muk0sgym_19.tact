message(0xAA) NestedMsg {
    foo: Int;
}

struct HoldsMsg {
    m: NestedMsg;
    data: Int;
}

contract PersistingMsgNestedStruct {
    s: HoldsMsg;

    init() {
        self.s = HoldsMsg{
            m: NestedMsg{ foo: 42 },
            data: 100,
        };
    }
}
