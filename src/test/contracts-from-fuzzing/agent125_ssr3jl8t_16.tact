struct Defaults {
    a: Int = 7;
    b: Bool = false;
    s: String = "abc";
}

contract StructWithDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}