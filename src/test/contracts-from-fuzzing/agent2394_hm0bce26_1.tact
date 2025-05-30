contract Test {
    x: Int;
    y: Bool;
    z: Address;
    s: String;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
        self.s = "test";
    }
}
