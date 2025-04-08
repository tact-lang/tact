struct NestedWithSerialization {
    a: Int as uint4;
    b: Int;
}

struct TopStruct {
    x: NestedWithSerialization;
    y: Int as int64;
}

contract NestedSerialStruct {
    stored: TopStruct;

    init() {
        self.stored = TopStruct{
            x: NestedWithSerialization{
                a:3,
                b:1000
            },
            y: -500
        };
    }
}
