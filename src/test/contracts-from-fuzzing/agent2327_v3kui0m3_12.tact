contract ContractDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "test";

    init() {
        self.x = 123;
        self.y = false;
        self.z = "done";
    }
}
