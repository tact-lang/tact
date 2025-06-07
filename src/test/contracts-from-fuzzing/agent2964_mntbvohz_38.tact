contract ManyMixedDefaults {
    a: Int = 10;
    b: Bool;
    c: String;
    d: Int? = null;
    e: String? = null;

    init() {
        self.b = false;
        self.c = "text";
    }
}