contract ZeroDefaults {
    x: Int = 0;
    y: Bool = false;
    z: String = "";

    init() {
        self.x = 42;
        self.y = true;
        self.z = "test";
    }
}