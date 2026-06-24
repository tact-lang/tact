struct OptionalsAndDefaults {
    a: Int?;
    b: Int = 42;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "default";
}

contract OptsAndDefs {
    data: OptionalsAndDefaults;
    init() {
        self.data = OptionalsAndDefaults{
            a: null,
            c: null,
            e: null
        };
    }
}