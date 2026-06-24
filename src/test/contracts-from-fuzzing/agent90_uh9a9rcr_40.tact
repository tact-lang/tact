struct OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct NestedOptionalPrims {
    inner: OptionalPrimitives?;
}

contract OptionalPrimsInStruct {
    data: NestedOptionalPrims;
    init() {
        self.data = NestedOptionalPrims{ inner: null };
    }
}