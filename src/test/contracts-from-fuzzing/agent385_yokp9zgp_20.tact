contract DefaultsAndOptionals {
    x: Int?;
    y: Int = 5;
    z: Int?;

    init() {
        self.x = null;
        self.y = 42;
        self.z = null;
    }
}