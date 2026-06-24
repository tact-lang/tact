contract TestContract {
    x: Int;
    y: Bool;
    z: Address;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
    }
}