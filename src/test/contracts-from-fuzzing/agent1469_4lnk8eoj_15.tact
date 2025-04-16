contract LongInitAssignments {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int;
    f: Int?;
    g: Bool;
    h: Bool?;

    init() {
        self.a = 100;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = 500;
        self.f = null;
        self.g = true;
        self.h = null;
    }
}