struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: OptionalStruct? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}