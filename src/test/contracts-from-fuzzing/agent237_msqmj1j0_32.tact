struct MixDefaultsOpts {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "x";
    f: String?;
}

contract ComboDefOpt {
    store: MixDefaultsOpts;
    init() {
        self.store = MixDefaultsOpts{
            b: null, d: null, f: null
        };
    }
}