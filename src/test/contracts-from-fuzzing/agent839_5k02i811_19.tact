contract MixedDefaults {
    x: Int = 5;
    y: Int? = null;
    z: String = "ok";
    b: Bool? = null;
    s: String? = null;
    init() {
        self.x = 10;
        self.y = 20;
        self.z = "changed";
        self.b = true;
        self.s = "filled";
    }
}