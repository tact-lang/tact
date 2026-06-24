contract ManyDefaults {
    x: Int = 1;
    y: Int? = null;
    z: Bool = true;
    s: String = "ok";

    init() {
        self.x = 5;
        self.y = 7;
        self.z = false;
        self.s = "fine";
    }
}
