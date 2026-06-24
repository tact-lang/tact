contract OptionalAddrInt {
    a: Address?;
    b: Int?;
    init() {
        self.a = null;
        self.b = null;
    }
}