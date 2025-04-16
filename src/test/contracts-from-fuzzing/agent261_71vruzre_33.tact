contract ManyOptionalPrims {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = true;
        self.e = null;
    }

    receive() {
        let _ = self.a;
    }
}