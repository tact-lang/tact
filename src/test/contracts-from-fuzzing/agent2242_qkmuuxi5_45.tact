contract ChangingOptionals {
    a: Int?;
    b: String?;

    init() {
        self.a = null;
        self.b = null;
        self.a = 42;
        self.b = "hi";
        self.a = null;
        self.b = null;
    }
}