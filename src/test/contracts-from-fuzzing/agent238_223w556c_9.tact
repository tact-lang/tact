struct ManyOptionalPrimitives {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Address?;
    g: Address?;
}

contract ManyOptPrims {
    data: ManyOptionalPrimitives;

    init() {
        self.data = ManyOptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}