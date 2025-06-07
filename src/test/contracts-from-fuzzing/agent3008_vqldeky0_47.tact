contract MixedTypes {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;

    init() {
        self.a = 5;
        self.b = null;
        self.c = "a";
        self.d = null;
        self.e = emptyCell().asSlice();
    }
}