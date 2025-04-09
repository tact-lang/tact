contract StringCaseSensitivity {
    foo: String;
    Foo: String;

    init() {
        self.foo = "lower";
        self.Foo = "upper";
    }
}