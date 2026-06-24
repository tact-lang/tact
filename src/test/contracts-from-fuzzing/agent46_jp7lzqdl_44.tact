message(0x99) M1 { x: Int }
message(0x98) M2 { y: Int }

struct NestedMessages {
    m1: M1;
    m2: M2?;
}

contract NestedMsgPersist {
    data: NestedMessages;

    init() {
        self.data = NestedMessages{
            m1: M1{ x: 11 },
            m2: null
        };
    }
}
