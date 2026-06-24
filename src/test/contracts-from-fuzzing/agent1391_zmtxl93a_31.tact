contract OptionalAddressStringInt {
    a: Address?;
    b: String?;
    c: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}