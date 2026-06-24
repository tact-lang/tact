contract TestContract {
    x: Int as int64 = 0;
    y: Int as uint64 = 100;
    z: Int as int64 = -100;

    init() {
        self.x = 42;
        self.y = 500;
        self.z = -42;
    }
}