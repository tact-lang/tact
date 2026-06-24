contract MixedOptionals {
    x: Int?;
    y: Bool;
    z: String?;

    init() {
        self.x = null;
        self.y = false;
        self.z = "data";
    }
}