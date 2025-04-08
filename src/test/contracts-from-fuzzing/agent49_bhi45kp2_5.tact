struct OptionalsAndDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "";
    f: String?;
}

contract TestContract {
    s: OptionalsAndDefaults;

    init() {
        self.s = OptionalsAndDefaults{
            b: null,
            d: null,
            f: null
        };
    }
}