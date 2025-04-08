contract ExplicitDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
    init() {
        self.x = 10;
        self.y = 20;
        self.z = 30;
    }
}