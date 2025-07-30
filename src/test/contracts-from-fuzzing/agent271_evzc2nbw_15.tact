contract NoDefaultsUninit {
    x: Int;
    y: Bool;
    z: Address;

    init() {
        self.x = 0;
        self.y = false;
        self.z = myAddress();
    }
}
