struct SerializeNested {
    a: Int as uint8;
    b: InnerSerialize;
}

struct InnerSerialize {
    c: Int as int16;
    d: Int as uint4;
}

contract NestedSerialization {
    x: SerializeNested;

    init() {
        self.x = SerializeNested{
            a: 5,
            b: InnerSerialize{ c: -100, d: 9 }
        };
    }
}