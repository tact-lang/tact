struct MixedDefaults {
    a: Int;
    b: Int = 10;
    c: String = "foo";
    d: Bool;
}

contract TestContract {
    mixed: MixedDefaults;

    init() {
        self.mixed = MixedDefaults{ a: 1, d: false };
    }
}
