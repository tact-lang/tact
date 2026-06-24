struct Msg1 { v: Int; }
struct Msg2 { v: Bool; }

struct NestedMsgContainer {
    m1: Msg1;
    m2: Msg2;
    v: Bool?;
}

contract NestedMsgFields {
    data: NestedMsgContainer;

    init() {
        self.data = NestedMsgContainer{
            m1: Msg1{ v: 99 },
            m2: Msg2{ v: true },
            v: null,
        };
    }
}