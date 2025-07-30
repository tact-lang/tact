contract ContractDefaults {
    x: Int = 123;
    y: Bool = true;
    z: String = "hi";

    init() {
        self.x = 321;
        self.y = false;
        self.z = "bye";
    }
}
