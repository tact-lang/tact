struct OptionalPrimitiveFields {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalPrimitivesTest {
    optPrims: OptionalPrimitiveFields;

    init() {
        self.optPrims = OptionalPrimitiveFields{
            intOpt: 100, boolOpt: true, stringOpt: "hello"
        };
    }
}