struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestDefaults {
    vals: DefaultVals;

    init() {
        self.vals = DefaultVals{
            d: null,
            e: null,
            f: null
        };
    }
}