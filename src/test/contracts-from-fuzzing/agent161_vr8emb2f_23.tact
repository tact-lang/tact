contract MixedDefaultsNulls {
    a: Int = 10;
    b: Int?;
    c: String = "hi";
    d: String?;

    init() {
        self.a = 15;
        self.b = null;
        self.c = "bye";
        self.d = null;
    }
}
