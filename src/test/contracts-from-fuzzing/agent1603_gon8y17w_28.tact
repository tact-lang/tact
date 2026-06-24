contract AllBoolOptional {
    x: Bool?;
    y: Bool?;
    z: Bool?;

    init() {
        self.x = null;
        self.y = true;
        self.z = null;
    }
}