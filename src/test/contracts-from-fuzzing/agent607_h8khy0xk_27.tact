contract OptionalAndTypes {
    x: Int?;
    y: Int as uint8;
    z: Bool?;

    init() {
        self.x = 10;
        self.y = 255;
        self.z = null;
    }
}