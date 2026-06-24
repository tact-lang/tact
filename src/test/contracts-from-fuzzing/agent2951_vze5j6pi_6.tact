struct OptionalsVsDefaults {
    intField: Int = 42;
    strField: String = "hi";
    optInt: Int?;
    optStr: String?;
}

contract OptionalsAndDefaults {
    data: OptionalsVsDefaults;

    init() {
        self.data = OptionalsVsDefaults{ };
    }
}