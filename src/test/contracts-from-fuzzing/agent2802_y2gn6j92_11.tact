struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
    d: Int? = null;
    e: Bool? = null;
}

contract HasDefaults {
    val: Defaulted = Defaulted{};

    init() {
        self.val = Defaulted{ a: 10, b: true, c: "changed", d: 5, e: true };
    }
}