contract SlicedStrings {
    a: String;
    b: String?;
    c: Slice;
    d: Slice?;

    init() {
        self.a = "hello";
        self.b = null;
        self.c = emptyCell().asSlice();
        self.d = null;
    }
}