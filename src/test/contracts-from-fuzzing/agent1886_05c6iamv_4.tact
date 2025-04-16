struct OptionalsAndDefaults {
    a: Int?;
    b: Bool = true;
    c: String = "test";
    d: Int = 42;
}

contract TestOptDef {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            a: null,
            b: false,
            c: "hello",
            d: 100
        };
    }
}