contract ConstDefaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "init";

    init() {
        self.x = 1;
        self.y = false;
        self.z = "changed";
    }
}
