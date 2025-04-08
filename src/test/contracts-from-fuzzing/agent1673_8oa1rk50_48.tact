contract OnlyDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "hi";

    init() {
        self.x = 2;
        self.y = false;
        self.z = "there";
    }
}