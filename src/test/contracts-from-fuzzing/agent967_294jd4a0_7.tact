contract VariousSerialization {
    x: Int as uint8;
    y: Int as int64;
    z: Int as int257;
    flag: Bool;

    init() {
        self.x = 1;
        self.y = 2;
        self.z = 3;
        self.flag = true;
    }
}