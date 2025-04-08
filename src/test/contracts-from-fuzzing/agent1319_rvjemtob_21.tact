struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructStateTest {
    maybeData: NestedOptionalStruct?;

    init() {
        self.maybeData = null;
    }
}