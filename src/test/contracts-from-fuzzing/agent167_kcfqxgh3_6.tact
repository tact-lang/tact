contract OnlyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = 1;
        self.b = "hello";
        self.c = true;
    }
}