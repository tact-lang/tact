contract OptionalAfterDefault {
    x: Int = 7;
    y: Int?;
    z: Bool = false;
    w: String?;

    init() {
        self.x = 8;
        self.y = null;
        self.z = true;
        self.w = null;
    }
}
