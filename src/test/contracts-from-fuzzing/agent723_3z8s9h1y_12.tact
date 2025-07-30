contract TestDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "ok";

    init() {
        self.x = 9;
        self.y = false;
        self.z = "wow";
    }
}