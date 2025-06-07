contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = null;
        self.e = true;
        self.f = "end";
    }
}