contract DefaultsExplicitMixed {
    a: Int = 7;
    b: Int;
    c: Bool = false;
    d: Bool;
    e: String = "x";
    f: String;

    init() {
        self.b = 11;
        self.d = true;
        self.f = "y";
    }
}