struct InnerNested {
    a: Int;
    b: String?;
}

struct OuterNested {
    x: Int;
    y: InnerNested;
    z: Int?;
}

contract TestContract {
    nestedField: OuterNested;

    init() {
        self.nestedField = OuterNested{
            x: 1,
            y: InnerNested{a: 2, b: "test"},
            z: null,
        };
    }
}
