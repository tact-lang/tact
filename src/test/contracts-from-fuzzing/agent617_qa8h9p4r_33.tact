contract InitDefaultsOverrides {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
    init() {
        self.x = 10;
        self.y = true;
        self.z = "world";
    }
}