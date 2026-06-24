contract SliceBoolIntMix {
    a: Slice;
    b: Bool;
    c: Int;
    init() {
        self.a = emptyCell().asSlice();
        self.b = true;
        self.c = 123;
    }
}