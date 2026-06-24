struct OptionalsAndDefaults {
    a: Int = 10;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract DefaultsWithOptionals {
    field: OptionalsAndDefaults;

    init() {
        self.field = OptionalsAndDefaults{
            c: null,
            d: null,
        };
    }
}
