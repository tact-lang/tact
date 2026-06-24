// many optional fields in contract persistent storage
contract TestContract {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;

    init() {
        self.a = null; self.b = 2; self.c = null; self.d = 4;
        self.e = 5; self.f = null; self.g = 7; self.h = null;
    }
}