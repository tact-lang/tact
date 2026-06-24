struct OptionalDefault {
    a: Int?;    
    b: Bool? = null;
    c: String? = null;
}

contract OptionalDefaults {
    s: OptionalDefault;

    init() {
        self.s = OptionalDefault{ a: null };
    }
}