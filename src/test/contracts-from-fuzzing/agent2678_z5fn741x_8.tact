contract WideOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "abc";
        self.d = null;
    }
}