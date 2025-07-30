struct SmallDefaults {
    i: Int = 1;
    b: Bool = true;
    s: String = "x";
}

contract HasDefaults {
    def: SmallDefaults;

    init() {
        self.def = SmallDefaults{};
    }
}