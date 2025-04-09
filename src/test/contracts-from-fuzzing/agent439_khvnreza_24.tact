contract Test24 {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address?;
    h: Cell?;
    i: Slice?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "text";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
    }

    receive() {}
}