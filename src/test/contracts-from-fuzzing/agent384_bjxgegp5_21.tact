struct OptionAndDefault {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Bool? = null;
}

contract OptionDefaults {
    s: OptionAndDefault = OptionAndDefault{
        a: null,
        b: true,
        c: null,
        d: null
    };

    init() {
        self.s.a = 7;
        self.s.d = false;
    }
}