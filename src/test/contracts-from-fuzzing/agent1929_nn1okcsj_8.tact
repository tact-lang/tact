contract OnlyOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
    w: Int?;

    init() {
        self.x = null;
        self.y = "hello";
        self.z = true;
        self.w = 123;
    }
}