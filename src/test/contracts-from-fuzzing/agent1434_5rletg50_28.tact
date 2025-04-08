contract MixOptAndDefaults {
    a: Int?;
    b: Int = 1;
    c: Bool?;
    d: Bool = true;
    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.d = false;
    }
}