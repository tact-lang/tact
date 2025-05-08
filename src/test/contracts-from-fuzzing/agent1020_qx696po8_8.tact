struct OptionalPrimitive {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalPrimitiveTest {
    values: OptionalPrimitive;

    init() {
        self.values = OptionalPrimitive{
            x: null,
            y: null,
            s: null
        };
    }
}