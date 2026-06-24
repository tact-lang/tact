contract NoDefaults {
    x: Int;
    y: Bool;
    z: Address;

    init() {
        self.x = 42;
        self.y = true;
        self.z = myAddress();
    }
}