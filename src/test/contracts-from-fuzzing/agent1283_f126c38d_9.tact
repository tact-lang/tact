struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract WithDefaults {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}