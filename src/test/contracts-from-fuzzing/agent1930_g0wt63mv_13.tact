contract DefaultsAndOverrides {
    x: Int = 1;
    y: Bool;
    z: String = "default";

    init() {
        self.y = false;
        self.z = "override";
    }
}