contract ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "c";

    init() {
        self.a = 5;
        self.b = true;
        self.c = "ccc";
    }
}