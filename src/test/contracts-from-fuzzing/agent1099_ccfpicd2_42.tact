contract MultipleOptionals {
    x: Int?;
    y: Int?;
    z: Int?;

    init() {
        self.x = null;
        self.y = 5;
        self.z = null;
    }
}