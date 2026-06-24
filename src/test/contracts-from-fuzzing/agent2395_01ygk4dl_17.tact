contract ContractDefaults {
    x: Int = 1;
    y: String = "default";
    z: Bool = false;
    optX: Int? = null;
    optY: String? = null;

    init() {
        self.x = 42;
        self.y = "changed";
        self.z = true;
        self.optX = 10;
        self.optY = "hello";
    }
}
