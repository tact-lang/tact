contract DefaultsMix {
    a: Int = 1;
    b: Bool = true;
    c: Slice;
    d: String;

    init() {
        self.c = emptyCell().asSlice();
        self.d = "text";
    }
}