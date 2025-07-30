struct DEF {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptStructDefaults {
    s: DEF;

    init() {
        self.s = DEF{ optInt: null, optBool: null, optStr: null };
    }
}