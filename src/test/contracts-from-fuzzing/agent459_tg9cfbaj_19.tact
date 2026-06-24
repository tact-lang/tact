contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = 42;
        self.b = true;
        self.c = null;
        self.d = "hi";
    }
}