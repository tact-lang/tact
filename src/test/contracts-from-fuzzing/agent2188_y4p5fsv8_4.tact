struct OptionalNest {
    field1: Bool?;
    field2: Int?;
    field3: String?;
}

contract OptionalComplex {
    inner: OptionalNest;
    init() {
        self.inner = OptionalNest{
            field1: null,
            field2: null,
            field3: null,
        };
    }
}