contract InitDefaultOverride {
    x: Int = 1;
    y: Bool = false;
    z: String = "default";

    init() {
        self.x = 42;
        self.y = true;
        self.z = "overridden";
    }
}