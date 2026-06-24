struct SWithDefaults {
    a: Int = 1;
    b: String = "default";
    c: Bool = false;
    d: Int?;
    e: String?;
}

contract Test {
    s: SWithDefaults;

    init() {
        self.s = SWithDefaults{
            d: null,
            e: null
        };
    }
}