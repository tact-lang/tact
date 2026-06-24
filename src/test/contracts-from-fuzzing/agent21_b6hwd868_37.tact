contract CrossOptional {
    x: Int?;
    y: Int;
    z: Int?;

    init() {
        self.x = null;
        self.y = 1;
        self.z = null;
    }
}