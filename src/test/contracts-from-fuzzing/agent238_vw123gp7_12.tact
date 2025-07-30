struct Defaulted {
    i: Int = 7;
    b: Bool = false;
    s: String = "zzz";
}

contract WithDefaults {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}