contract Mix {
    x: Int;
    y: Bool;
    z: String;
    w: Address;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "hi";
        self.w = myAddress();
    }
}