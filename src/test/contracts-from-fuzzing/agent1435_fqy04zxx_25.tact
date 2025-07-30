contract MixedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;

    init() {
        self.x = 42;
        self.y = null;
        self.z = "hi";
    }
}