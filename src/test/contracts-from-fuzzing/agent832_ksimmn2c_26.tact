contract ContractDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";

    init() {
        self.x = 10;
        self.y = false;
        self.z = "override";
    }
}