struct OptionalsAndDefaults {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Slice?;
}

contract Test {
    data: OptionalsAndDefaults;
    init() {
        self.data = OptionalsAndDefaults{
            a:null,
            c:null,
            d:null
        };
    }
}