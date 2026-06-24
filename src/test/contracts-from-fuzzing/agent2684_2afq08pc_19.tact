contract MixedTypes {
    i: Int = 0;
    s: String = "";
    b: Bool = false;
    sl: Slice;

    init() {
        self.i = 123;
        self.s = "abc";
        self.b = true;
        self.sl = emptyCell().asSlice();
    }
}
