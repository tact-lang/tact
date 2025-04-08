contract TestContract {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 4;
        self.e = true;
        self.f = "hi";
        self.g = null;
        self.h = false;
        self.i = "bye";
    }

    receive() {}
}