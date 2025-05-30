struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

contract DoubleInner {
    field: OuterStruct;

    init() {
        self.field = OuterStruct {
            inner1: InnerStruct { a: 1, b: true },
            inner2: InnerStruct { a: 2, b: false }
        };
    }
}