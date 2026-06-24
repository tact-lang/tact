struct Defaulted {
    a: Int = 42;
    b: String = "foo";
    c: Bool = true;
}

contract WithDefaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}