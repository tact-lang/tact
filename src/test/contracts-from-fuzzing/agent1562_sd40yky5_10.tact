contract TestContract {
    x: Int as int64;
    y: Int as uint8;
    z: Int as int257;
    flag: Bool;
    opt: Int?;
    init() {
        self.x = 100;
        self.y = 255;
        self.z = -123456789;
        self.flag = true;
        self.opt = null;
    }
}