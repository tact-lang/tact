struct SerialAndNested {
    a: Int as uint8;
    b: NestedS;
}

struct NestedS {
    c: Int as int16;
    d: Int as uint32;
}

contract SerialNest {
    data: SerialAndNested;

    init() {
        self.data = SerialAndNested{
            a:1,
            b: NestedS{ c:-1, d:2 }
        };
    }
}