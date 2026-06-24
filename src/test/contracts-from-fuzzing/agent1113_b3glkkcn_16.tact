struct OptionalsDefaults {
    x: Int?;
    y: Bool?;
}

contract OptDef {
    data: OptionalsDefaults;

    init() {
        self.data = OptionalsDefaults{
            x: null,
            y: null
        };
    }
}