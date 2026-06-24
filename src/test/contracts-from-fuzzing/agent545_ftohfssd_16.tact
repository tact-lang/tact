contract TestContract {
    x: Int as uint4;
    y: Int as int64;
    z: Int as coins;

    init() {
        self.x = 3;
        self.y = -42;
        self.z = ton("1");
    }

    receive() {}
}