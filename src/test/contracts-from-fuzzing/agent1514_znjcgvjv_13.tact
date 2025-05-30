struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract StructWithDefaults {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}