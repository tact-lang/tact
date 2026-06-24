contract MixedOptDefault {
    a: Int?;
    b: Bool = false;
    c: String?;

    init() {
        self.a = null;
        self.c = null;
    }
}