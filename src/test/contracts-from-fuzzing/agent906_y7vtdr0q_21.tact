struct OptionalsAndDefaults {
    a: Int?;
    b: Bool = true;
    c: String?;
}

contract OptDefaults {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            a: null,
            c: null,
        };
    }
}