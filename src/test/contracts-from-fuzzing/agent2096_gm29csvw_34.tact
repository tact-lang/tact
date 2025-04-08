contract NestedInitOpt {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool;

    init() {
        self.a = null;
        self.b = null;
        self.c = 100;
        self.d = false;
    }
}