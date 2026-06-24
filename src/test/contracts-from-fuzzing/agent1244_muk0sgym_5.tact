struct OnlyOptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptPrimitivesOnly {
    data: OnlyOptionalPrimitives;

    init() {
        self.data = OnlyOptionalPrimitives{
            a: null,
            b: null,
            c: null,
        };
    }
}
