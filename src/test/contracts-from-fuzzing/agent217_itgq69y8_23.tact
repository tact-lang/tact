struct SubWithDefaults {
    a: Int? = null;
    b: Bool? = true;
}

contract OptDefaults2 {
    s1: SubWithDefaults = SubWithDefaults{};
    s2: SubWithDefaults? = null;

    init() {
        self.s1 = SubWithDefaults{};
        self.s2 = null;
    }
}