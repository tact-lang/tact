contract OnlyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;

    init() {
        self.x = 10;
        self.y = null;
        self.z = "abc";
    }
}