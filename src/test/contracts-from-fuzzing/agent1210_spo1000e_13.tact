contract OnlyDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "abc";

    init() {
        self.x = 5;
        self.y = true;
        self.z = "abc";
    }
}