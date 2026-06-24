struct OptionalNested {
    a: Int?;
    b: Bool?;
}

struct OuterWithOptional {
    nestedOpt: OptionalNested?;
    plain: Int;
}

contract OptionalStructField {
    data: OuterWithOptional;

    init() {
        self.data = OuterWithOptional{
            nestedOpt: OptionalNested{ a: 7, b: null },
            plain: 42
        };
    }
}
