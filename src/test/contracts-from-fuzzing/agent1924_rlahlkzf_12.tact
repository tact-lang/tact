contract OptionalVariants {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
    c: Cell?;
    s: Slice?;

    init() {
        self.x = 123;
        self.y = null;
        self.z = "zzz";
        self.a = null;
        self.c = null;
        self.s = emptyCell().asSlice();
    }
}