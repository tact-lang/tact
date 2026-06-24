struct SDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
}

contract DefaultsAndOpt {
    s: SDefaults;

    init() {
        self.s = SDefaults{
            d: null
        };
    }
}