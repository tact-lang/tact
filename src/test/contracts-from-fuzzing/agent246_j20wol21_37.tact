contract OnlyOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
    z: Int? as uint64;
    q: Bool?;

    init() {
        self.x = null;
        self.y = null;
        self.s = null;
        self.z = null;
        self.q = null;
    }
}