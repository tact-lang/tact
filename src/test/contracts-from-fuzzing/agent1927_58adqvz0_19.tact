contract OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: String?;
    q: Address?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.q = null;
    }
}