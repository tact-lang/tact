contract TestContract {
    x: Int as uint64;
    y: Int as int64;
    z: Int as coins;

    init() {
        self.x = 123;
        self.y = -456;
        self.z = 789;
    }
}