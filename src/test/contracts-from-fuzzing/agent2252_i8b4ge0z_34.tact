message(0x33) Msg1 { f1: Int }
message(0x34) Msg2 { f2: Bool }
message(0x35) Msg3 {}

struct WrapMsgs { m1: Msg1; m2: Msg2; m3: Msg3 }

contract NestedMessagesInStruct {
    inner: WrapMsgs;
    init() {
        self.inner = WrapMsgs{
            m1: Msg1{ f1: 1 },
            m2: Msg2{ f2: true },
            m3: Msg3{},
        };
    }
}