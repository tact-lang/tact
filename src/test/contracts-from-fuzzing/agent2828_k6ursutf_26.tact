struct Defaults {
    a: Int = 5;
    b: Int = 6;
}

contract StructWithDefaults {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}