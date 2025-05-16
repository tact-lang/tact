contract SimpleOptional {
    x: Int?;
    y: Bool?;
    z: Int?;

    init() {
        self.x = null;
        self.y = true;
        self.z = 42;
    }
}