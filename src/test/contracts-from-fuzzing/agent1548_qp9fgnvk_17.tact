contract InitDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "hi";

    init() {
        self.x = 42;
        self.y = true;
        self.z = "bye";
    }
}