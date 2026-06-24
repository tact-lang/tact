struct OptionalsAndDefaults {
    x: Int?;
    y: Int = 42;
    s: String?;
    b: Bool = true;
}

contract OptionalWithDefaults {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            x: null,
            y: 100,
            s: null,
            b: false
        };
    }
}