contract OptionalPrimitiveVariants {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
    }
}