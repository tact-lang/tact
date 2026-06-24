contract MixedDefaults {
    a: Int = 3;
    b: Bool;
    c: Bool? = null;
    d: String = "hey";

    init() {
        self.b = true;
        self.c = false;
    }
}