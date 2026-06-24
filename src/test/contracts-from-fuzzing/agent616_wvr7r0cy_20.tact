contract WithDefaults {
    x: Int = 7;
    y: Bool = false;
    z: String = "hello";

    init() {
        self.x = 42;
        self.y = true;
        self.z = "world";
    }
}