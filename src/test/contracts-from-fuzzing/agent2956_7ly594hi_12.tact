struct OptionalsAndDefaults {
    a: Int = 10;
    b: Int?;
    c: Bool?;
    d: String = "default";
}

contract OptDef {
    val: OptionalsAndDefaults;

    init() {
        self.val = OptionalsAndDefaults{
            b: null,
            c: null,
        };
    }
}
