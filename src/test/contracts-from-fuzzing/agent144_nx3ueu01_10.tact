contract FieldDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "default";

    init() {
        self.x = 20;
        self.y = true;
        self.z = "override";
    }
}
