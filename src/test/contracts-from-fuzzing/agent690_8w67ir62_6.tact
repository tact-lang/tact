struct Defaults {
    foo: Int = 1;
    bar: String = "abc";
    baz: Bool = true;
}

contract WithDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}