contract ManyOptionalFieldsMixed {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: Slice?;
    f: Slice;
    g: String?;
    h: String;

    init() {
        self.a = null;
        self.b = 1;
        self.c = true;
        self.d = false;
        self.e = null;
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = "abc";
    }
}