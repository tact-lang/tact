contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Int?;
    h: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = "hello";
        self.g = 100;
        self.h = false;
    }
}