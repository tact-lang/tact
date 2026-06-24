struct Mixed {
    a: Int;
    b: Int?;
    c: Int? = null;
    d: Int = 7;
}

contract MixedDefaults {
    rec: Mixed;

    init() {
        self.rec = Mixed{ a: 5, b: 6 };
    }
}
