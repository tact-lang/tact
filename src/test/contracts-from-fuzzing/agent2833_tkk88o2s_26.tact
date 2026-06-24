contract TopLevelOptional {
    field: TestStruct?;

    init() {
        self.field = null;
    }
}

struct TestStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}