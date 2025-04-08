contract OnlyOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
    c: Cell?;
    s: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.a = null;
        self.c = null;
        self.s = null;
    }
}