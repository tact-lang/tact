contract SerialOrdered {
    x: Int as uint4;
    y: Int as uint64;
    z: Int as int256;
    b: Bool;
    s: String;

    init() {
        self.x = 7;
        self.y = 63;
        self.z = -5;
        self.b = true;
        self.s = "order";
    }

    receive() {}
}