contract OptionalFields {
    x: Int?;
    y: Bool?;
    z: Address?;

    init() {
        self.x = null;
        self.y = true;
        self.z = null;
    }
}