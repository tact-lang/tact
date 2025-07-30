contract OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: Address?;
    c: Cell?;
    s: Slice?;
    st: String?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.c = null;
        self.s = null;
        self.st = null;
    }
}
