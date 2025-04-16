contract ManyDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "s";

    init() {
        self.a = 5;
        self.b = false;
        self.c = "changed";
    }
}