struct Combo {
    a: Int = 1;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;
    e: String = "x";
    f: String? = null;
    g: Address? = null;
}

contract ComboDefaults {
    c: Combo;

    init() {
        self.c = Combo{};
    }
}