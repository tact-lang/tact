contract MixOptDefaults {
    a: Int = 1;
    b: Int?;
    c: Int? = null;
    d: String = "abc";
    e: String?;
    f: String? = null;

    init() {
        self.b = 10;
        self.e = "def";
    }
}