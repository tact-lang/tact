contract DefaultsVsInit {
    foo: Int = 10;
    bar: Bool;
    baz: String = "x";

    init() {
        self.bar = true;
        self.baz = "y"; // overrides default
    }
}