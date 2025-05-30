contract TestOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = null;
        self.d = "hi";
    }
}