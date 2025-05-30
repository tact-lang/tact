struct Leaf {
    a: Int as uint8;
    b: Int as int16;
}

struct Mid {
    f1: Leaf;
    flag: Int as uint1;
}

struct TopWithSerial {
    nested: Mid;
    x: Int as uint64;
    y: Int as int32;
}

contract ExplicitSerialNested {
    s: TopWithSerial;

    init() {
        self.s = TopWithSerial{
            nested: Mid{ f1: Leaf{a:1,b:2}, flag:1},
            x: 3,
            y: -4
        };
    }
}
