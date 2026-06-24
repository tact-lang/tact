struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "q";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract WithDefaults {
    val: DefaultVals;
    init() {
        self.val = DefaultVals{
            d: null,
            e: null,
            f: null,
        };
    }
}