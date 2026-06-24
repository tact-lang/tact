contract NestedInnerOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int;
    e: String;
    f: Bool;

    init() {
        self.a = null;
        self.b = "test";
        self.c = null;
        self.d = 5;
        self.e = "done";
        self.f = true;
    }
}