struct Defaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "test";
}

contract StructWithDefaults {
    d: Defaults;
    init() {
        self.d = Defaults{};
    }
}