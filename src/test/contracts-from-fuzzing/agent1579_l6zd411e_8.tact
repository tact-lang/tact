contract InitDefaults {
    x: Int = 100;
    y: Bool = true;
    z: String = "default";

    init() {
        self.x = 200;
        self.y = false;
        self.z = "changed";
    }

    receive() {
        self.x = self.x + 1;
    }
}