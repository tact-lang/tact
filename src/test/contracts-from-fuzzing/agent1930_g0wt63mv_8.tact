contract AllOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = 123;
        self.b = null;
        self.c = "hello";
        self.d = null;
    }
}