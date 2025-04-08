struct MixedDefaults {
    a: Int = 5;
    b: String = "str";
    c: Bool;
    d: Int?;
}

contract DefaultFields {
    mixed: MixedDefaults;

    init() {
        self.mixed = MixedDefaults{
            a: 42,
            b: "new",
            c: true,
            d: null
        };
    }
}