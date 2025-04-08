contract OnlyOptionals {
    x: Int?;
    y: Int?;
    z: Bool?;

    init() {
        self.x = null;
        self.y = 5;
        self.z = false;
    }
}