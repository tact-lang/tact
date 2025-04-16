struct Ab {
    val: Int;
}

contract HasDefaults {
    test: Ab;
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "str";

    init() {
        self.test = Ab{ val: 5 };
        self.foo = 20;
        self.bar = false;
        self.baz = "changed";
    }
}