contract MixedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "def";

    init() {
        self.a = 2;
        self.b = false;
        self.c = "changed";
    }
}