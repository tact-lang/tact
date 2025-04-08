contract PersistOptPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = myAddress();
    }
}