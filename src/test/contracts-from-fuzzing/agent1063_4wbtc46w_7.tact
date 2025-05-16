struct InnerStruct {
    a: Int;
    b: Int;
}

struct OuterStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

contract DoubleNested {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            inner1: InnerStruct{ a: 1, b: 2 },
            inner2: InnerStruct{ a: 3, b: 4 }
        };
    }
}