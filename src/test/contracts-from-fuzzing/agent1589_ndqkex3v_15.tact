contract BasicOptionals {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = "hi";
    }
}