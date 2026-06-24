contract MixOptSer {
    a: Int? as uint64;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
    f: String;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = 42;
        self.e = null;
        self.f = "foo";
    }
}