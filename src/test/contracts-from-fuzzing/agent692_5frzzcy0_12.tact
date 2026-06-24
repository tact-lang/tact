struct Defaulted {
    a: Int = 1;
    b: Int = 2;
    c: String = "hi";
    d: Bool = false;
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;
}

contract WithDefaults {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}