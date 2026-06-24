struct OptOpt {
    val: Int?;
}

contract OptDefaults {
    foo: Int?;
    bar: String?;
    nested: OptOpt?;

    init() {
        self.foo = null;
        self.bar = "hi";
        self.nested = OptOpt{val: null};
    }
}
