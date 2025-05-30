contract TestContract {
    x: Int as uint8;
    y: Int as int32;
    z: Int as coins;

    init() {
        self.x = 1;
        self.y = -10;
        self.z = ton("1");
    }
}