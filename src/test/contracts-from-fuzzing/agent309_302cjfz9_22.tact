struct NestedSerialization {
    a: Int as uint8;
    b: Child;
}

struct Child {
    c: Int as uint16;
    d: Int;
}

contract NestedSerializationContract {
    x: NestedSerialization;

    init() {
        self.x = NestedSerialization{
            a: 123,
            b: Child{ c: 456, d: 789 }
        };
    }
}