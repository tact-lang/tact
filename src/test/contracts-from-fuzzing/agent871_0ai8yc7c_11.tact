contract ManyOptionals {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: String = "hi";
    e: Int = 7;
    f: Bool?;
    g: String?;

    init() {
        self.a = null;
        self.c = null;
        self.f = true;
        self.g = "test";
    }
}