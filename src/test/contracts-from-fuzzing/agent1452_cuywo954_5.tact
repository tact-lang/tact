struct NestedOptionalStruct {
    inner: InnerOptional?;
}

struct InnerOptional {
    x: Int;
    y: Bool?;
    z: Address?;
}

contract OptionalNestedStructTest {
    optNested: NestedOptionalStruct?;

    init() {
        self.optNested = null;
    }
}
