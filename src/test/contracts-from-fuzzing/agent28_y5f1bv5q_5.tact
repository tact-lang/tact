contract Test {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";
    f: Slice;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "changed";
        self.f = emptyCell().asSlice();
    }
}