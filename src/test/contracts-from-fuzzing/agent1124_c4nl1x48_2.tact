struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String;
}

contract OptionalNestedStorage {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ foo: null, bar: true, baz: "hi" };
    }
}