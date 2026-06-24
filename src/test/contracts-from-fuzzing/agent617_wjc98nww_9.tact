struct DefaultsOpt {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int?; // implicit default to null
}

contract WithDefaults {
    s: DefaultsOpt;
    init() {
        self.s = DefaultsOpt{ a: 2, b: true, c: "world", d: null };
    }
}
