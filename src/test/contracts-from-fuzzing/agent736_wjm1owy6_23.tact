contract TestContract {
    x: Int as uint4 = 5;
    y: Int as int64 = 10;
    z: Int as coins = 15;

    init() {
        self.x = 5;
        self.y = 10;
        self.z = 15;
    }

    receive() {
        dump(self.z);
    }
}