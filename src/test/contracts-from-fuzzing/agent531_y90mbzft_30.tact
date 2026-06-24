contract NoInit {
    a: Int;
    b: String;
    c: Bool;
    d: Slice;

    init() {
        self.a = 42;
        self.b = "hi";
        self.c = true;
        self.d = emptyCell().asSlice();
    }
}