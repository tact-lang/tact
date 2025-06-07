contract OnlyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    q: Address?;
    r: Cell?;
    s: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.q = null;
        self.r = null;
        self.s = null;
    }
}
