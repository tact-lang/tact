struct Defaulted {
    i: Int = 99;
    b: Bool = true;
    s: String = "s";
}

contract StructWithDefaults {
    f: Defaulted;

    init() {
        self.f = Defaulted{};
    }
}