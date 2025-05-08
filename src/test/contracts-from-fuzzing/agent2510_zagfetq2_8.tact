struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    x: InnerStruct;
    y: InnerStruct;
}

contract DoubleNested {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{
            x: InnerStruct{ a: 1, b: false },
            y: InnerStruct{ a: 2, b: true }
        };
    }
}