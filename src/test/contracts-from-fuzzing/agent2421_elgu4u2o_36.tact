contract MixOptAndDef {
    a: Int = 5;
    b: Bool? = null;
    c: String?;
    d: Address?;

    init() {
        self.c = null;
        self.d = null;
    }
}