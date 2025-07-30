contract OnlyBools {
    a: Bool;
    b: Bool = true;
    c: Bool?;
    d: Bool?;
    init() {
        self.a = false;
        self.c = true;
        self.d = null;
    }
}