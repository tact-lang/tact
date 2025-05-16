struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
    d: Address? = null;
}

contract DefaultsEverywhere {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}