contract LotsOfBooleans {
    a: Bool;
    b: Bool = true;
    c: Bool;
    d: Bool = false;
    e: Bool;

    init() {
        self.a = false;
        self.c = true;
        self.e = true;
    }
}