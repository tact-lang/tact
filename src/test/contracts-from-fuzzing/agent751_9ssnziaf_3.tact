struct OptionalStruct {
    field: Int?;
}

contract OptionalFieldTest {
    foo: OptionalStruct;

    init() {
        self.foo = OptionalStruct{ field: null };
    }
}