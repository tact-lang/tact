// test many optional persistent state fields directly
contract ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Bool?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.d = false;
        self.e = 5;
        self.f = true;
        self.g = "Hello";
        self.h = null;
    }
}