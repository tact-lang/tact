struct BasicNested {
    a: Int;
    b: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestNested {
    nested: BasicNested;

    init() {
        self.nested = BasicNested{
            a: 1,
            b: InnerStruct{ x: 2, y: true }
        };
    }
}
