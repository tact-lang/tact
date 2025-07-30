contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = 5;
    }
}