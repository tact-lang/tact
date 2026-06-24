contract ExplicitDefaults {
    x: Int = 3;
    y: Bool = false;
    z: String = "hello";

    init() {
        self.x = 7;
        self.y = true;
        self.z = "bye";
    }
}