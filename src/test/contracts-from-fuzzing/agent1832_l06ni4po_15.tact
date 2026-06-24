struct ComplexFieldOrder {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String?;
}

contract StructOrder {
    field: ComplexFieldOrder;

    init() {
        self.field = ComplexFieldOrder{
            a: 1,
            b: true,
            c: null,
            d: "hi",
            e: null,
            f: null
        };
    }
}
