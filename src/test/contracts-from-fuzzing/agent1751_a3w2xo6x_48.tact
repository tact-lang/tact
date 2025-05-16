struct OptionalsAndDefaults {
    x: Int?;
    y: Int = 100;
    z: Bool?;
    s: String?;
}

contract OptionalsDefaultsContract {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            x: null,
            y: 100,
            z: null,
            s: null
        };
    }
}
