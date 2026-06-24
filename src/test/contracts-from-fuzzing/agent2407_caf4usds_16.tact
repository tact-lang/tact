struct Defaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "abc";
}

contract WithDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}