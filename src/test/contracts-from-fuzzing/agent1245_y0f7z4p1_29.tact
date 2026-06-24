struct NestedOptionalStruct {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptionalStructTest {
    optStruct: NestedOptionalStruct?;

    init() {
        self.optStruct = null;
    }
}
