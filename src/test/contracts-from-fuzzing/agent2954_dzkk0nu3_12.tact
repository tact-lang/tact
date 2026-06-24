contract MixedOptionalsAndDefaults {
    a: Int = 5;
    b: Bool?;
    c: String = "hi";
    d: Address?;
    e: Slice;
    init() {
        self.b = null;
        self.d = null;
        self.e = emptyCell().asSlice();
    }
}
