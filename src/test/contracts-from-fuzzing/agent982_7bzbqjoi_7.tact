struct OptionalsAndDefaults {
    a: Int? = null;
    b: Int = 1;
    c: Int?;
    d: Int = 2;
    e: Int?;
    f: Int = 3;
}

contract MixedContract {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{};
    }
}