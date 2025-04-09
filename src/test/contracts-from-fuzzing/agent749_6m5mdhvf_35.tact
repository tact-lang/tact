contract MixedMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 1;
    e: Bool = false;
    f: String = "txt";

    init() {
        self.a = null;
        self.b = null;
        self.c = "hello";
        self.d = 10;
        self.e = true;
        self.f = "bye";
    }
}