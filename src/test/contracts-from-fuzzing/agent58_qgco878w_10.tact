struct Defaults {
    foo: Int = 123;
    bar: Bool = true;
    baz: String = "hello";
}

contract WithDefaults {
    vals: Defaults;

    init() {
        self.vals = Defaults{};
    }
}