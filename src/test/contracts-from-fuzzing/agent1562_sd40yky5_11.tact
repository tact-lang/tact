struct SerializedNested {
    smallInt: Int as uint4;
    nested: Inner;
}

struct Inner {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    sn: SerializedNested;
    init() {
        self.sn = SerializedNested{
            smallInt: 10,
            nested: Inner{
                field1: 123,
                field2: true,
            },
        };
    }
}