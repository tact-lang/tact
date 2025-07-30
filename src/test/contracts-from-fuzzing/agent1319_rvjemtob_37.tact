struct OptionalStruct {
    a: Int?;
}

contract OptionalFieldAssign {
    foo: OptionalStruct;
    init() {
        self.foo = OptionalStruct { a: null };
    }
}