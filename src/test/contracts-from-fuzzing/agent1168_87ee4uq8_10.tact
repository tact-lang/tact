contract InitDefaults {
    x: Int = 5;
    y: Bool;
    z: String = "hello";

    init() {
        self.y = true;
        self.z = "world";
    }
}