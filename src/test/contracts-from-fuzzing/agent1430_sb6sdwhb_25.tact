contract MixOptDefault {
    a: Int?;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.s = "hello";
    }
}
