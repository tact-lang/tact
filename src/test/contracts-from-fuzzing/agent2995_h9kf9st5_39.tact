contract ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;

    init() {
        self.a = null;
        self.b = 5;
        self.c = true;
        self.d = "hi";
        self.e = null;
    }
}