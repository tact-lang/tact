contract InitDefaults {
    x: Int = 5;
    y: Bool = true;
    s: String = "abc";
    z: Address; // intentionally uninitialized

    init() {
        self.z = myAddress();
    }
}
