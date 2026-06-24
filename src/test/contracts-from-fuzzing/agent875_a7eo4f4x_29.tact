struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalPrimitivesTest {
    x: OptionalPrimitives;
    init() {
        self.x = OptionalPrimitives{
            a: null,
            b: null,
            c: null
        };
    }
}