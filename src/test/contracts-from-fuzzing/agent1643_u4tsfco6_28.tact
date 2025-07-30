contract OnlyDefaults {
    x: Int = 7;
    y: Bool = false;
    z: String = "hi";

    init() {
        self.x = 8;
        self.y = true;
        self.z = "bye";
    }
}