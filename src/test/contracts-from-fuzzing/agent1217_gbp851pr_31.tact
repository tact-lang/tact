contract DifferentDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "hi";

    init() {
        self.x = 20;
        self.y = true;
        self.z = "bye";
    }
}