struct OptionDefaults {
    a: Int?;
    b: Bool? = true;
    c: String? = null;
}

contract OptionalDefaults {
    o: OptionDefaults;

    init() {
        self.o = OptionDefaults{a: null};
    }
}
