contract OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
    c: Cell?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.addr = null;
        self.c = null;
    }
}
