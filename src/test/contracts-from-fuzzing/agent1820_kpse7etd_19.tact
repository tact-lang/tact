contract DefaultOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}