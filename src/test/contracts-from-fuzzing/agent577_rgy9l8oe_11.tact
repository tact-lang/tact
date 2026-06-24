contract TestContract {
    n: Int as uint4;
    x: Int as int64;
    y: Int as uint64;
    z: Int as coins;

    init() {
        self.n = 7;
        self.x = -5;
        self.y = 100;
        self.z = ton("1");
    }
}