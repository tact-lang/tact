contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "abc";
    }
}