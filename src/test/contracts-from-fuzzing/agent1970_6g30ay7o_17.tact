contract TestDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Slice? = null;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell().asSlice();
    }
}