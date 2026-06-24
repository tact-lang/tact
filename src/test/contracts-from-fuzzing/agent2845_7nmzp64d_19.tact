struct NestedMessages {
    m1: Message1;
    m2: Message2;
}

message(0x12) Message1 {
    foo: Int;
}

message(0x34) Message2 {
    bar: Bool;
}

contract StructWithMessages {
    data: NestedMessages;

    init() {
        self.data = NestedMessages{
            m1: Message1{ foo: 123 },
            m2: Message2{ bar: true }
        };
    }
}