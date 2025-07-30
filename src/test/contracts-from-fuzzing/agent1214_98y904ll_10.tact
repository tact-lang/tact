contract Test10 {
    a: Int = 5;
    b: Int;
    c: Bool;
    d: String;
    e: Slice;

    init() {
        self.b = 10;
        self.c = true;
        self.d = "test";
        self.e = emptyCell().asSlice();
    }
}