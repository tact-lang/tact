contract MixDefaults {
    foo: Int;
    bar: Bool = false;
    baz: String;

    init() {
        self.foo = 55;
        self.baz = "x";
    }
}