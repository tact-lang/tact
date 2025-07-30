contract OptionalMulti {
    x: Int?;
    y: Bool?;
    z: String?;
    u: Address?;
    v: Cell?;
    w: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.u = null;
        self.v = null;
        self.w = null;
    }
}