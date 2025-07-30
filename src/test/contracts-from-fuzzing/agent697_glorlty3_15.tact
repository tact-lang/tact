contract DefaultOptionalFields {
    a: Int?;
    b: String?;
    c: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}