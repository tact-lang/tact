contract OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: Address? = null;

    init() {
        self.x = 5; self.y = true; self.z = myAddress();
    }
}