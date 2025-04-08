contract TestContract {
    optionalStruct: Nested?;

    init() {
        self.optionalStruct = null;
    }
}

struct Nested {
    foo: Int;
    bar: Bool;
    baz: String;
}