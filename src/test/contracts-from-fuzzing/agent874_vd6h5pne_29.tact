contract OptNullInit {
    x: Int?;
    y: Bool?;
    z: String?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}
