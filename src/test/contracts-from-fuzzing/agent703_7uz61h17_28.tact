contract BoolUintOverlay {
    a: Int as uint1;
    b: Bool;
    c: Int as uint32;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 42;
    }
}