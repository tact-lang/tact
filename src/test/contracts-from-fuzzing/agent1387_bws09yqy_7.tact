contract SimpleOptionals {
    a: Int?;
    b: Bool?;
    c: Int;
    d: Bool;

    init() {
        self.a = 100;
        self.b = null;
        self.c = 77;
        self.d = true;
    }
}