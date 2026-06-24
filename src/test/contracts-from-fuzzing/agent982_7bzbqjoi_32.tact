contract NestedTupleLike {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String?;

    init() {
        self.a = 1; self.b = false; self.c = "hi";
        self.d = 2; self.e = true; self.f = null;
    }
}