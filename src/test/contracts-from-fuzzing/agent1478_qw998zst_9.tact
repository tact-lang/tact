contract TestContract {
    x: Int as uint8;
    y: Int as int64;
    flag: Bool;
    opt: Int?;

    init() {
        self.x = 255;
        self.y = -12345678;
        self.flag = true;
        self.opt = null;
    }
}
