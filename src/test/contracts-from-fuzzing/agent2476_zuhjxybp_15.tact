contract OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Slice? = null;

    init() {
        self.a = 5;
        self.b = false;
        self.c = "test";
        self.d = emptyCell().asSlice();
    }
}