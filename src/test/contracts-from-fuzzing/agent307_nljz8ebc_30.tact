contract PrimitiveDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "hi";

    init() {
        self.x = 1;
        self.y = false;
        self.z = "bye";
    }
}