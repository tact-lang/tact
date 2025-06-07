contract BoolDefaultMix {
    a: Bool;
    b: Bool = true;
    c: Bool;
    d: Bool = false;

    init() {
        self.a = false;
        self.c = true;
    }
}