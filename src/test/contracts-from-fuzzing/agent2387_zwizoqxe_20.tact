contract OptionalSimple {
    x: Int?;
    y: Bool?;
    z: Address?;
    init() {
        self.x = 3;
        self.y = null;
        self.z = null;
    }
}