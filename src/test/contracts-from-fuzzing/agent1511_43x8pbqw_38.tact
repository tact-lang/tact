contract InitAllFromInit {
    x: Int;
    y: Bool;
    z: Address;

    init() {
        self.x = 10;
        self.y = true;
        self.z = myAddress();
    }
}