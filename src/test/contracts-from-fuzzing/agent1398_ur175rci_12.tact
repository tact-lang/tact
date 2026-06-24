struct ComplexDefaults {
    i: Int = 7;
    optStr: String? = null;
    optBool: Bool? = null;
    str: String = "evil";
    flag: Bool = false;
}

contract ComplexDefaultStates {
    s: ComplexDefaults;

    init() {
        self.s = ComplexDefaults{};
    }
}