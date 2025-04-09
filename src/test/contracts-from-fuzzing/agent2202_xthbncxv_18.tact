contract OnlyDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "abc";

    init() {
        self.x = 42;
        self.y = false;
        self.z = "def";
    }
}