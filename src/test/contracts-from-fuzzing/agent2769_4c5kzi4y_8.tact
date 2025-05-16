contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    s1: String?;
    s2: String?;
    s3: String?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = 5;
        self.e = true;
        self.f = null;
        self.g = false;
        self.s1 = "abc";
        self.s2 = null;
        self.s3 = "def";
    }
}