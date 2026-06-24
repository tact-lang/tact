struct ManyOptionalPrimitives {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
}

contract TestContract {
    stuff: ManyOptionalPrimitives;

    init() {
        self.stuff = ManyOptionalPrimitives{
            i1: null,
            i2: 1,
            i3: -1,
            b1: true,
            b2: null,
            s1: null,
            s2: "hello",
        };
    }
}