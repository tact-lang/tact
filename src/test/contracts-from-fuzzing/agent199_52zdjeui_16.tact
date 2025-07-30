struct StructVaried {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract MixedVariants {
    v: StructVaried;

    init() {
        self.v = StructVaried{
            a: 1,
            b: null,
            c: "abc",
            d: null,
            e: true,
            f: null,
        };
    }
}