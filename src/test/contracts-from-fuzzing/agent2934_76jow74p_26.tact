contract LargeInitAssign {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: String?;

    init() {
        self.a = 12;
        self.b = false;
        self.c = null;
        self.d = "foo";
        self.e = null;
    }
}