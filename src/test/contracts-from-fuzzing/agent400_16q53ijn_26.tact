contract ZeroInit {
    n: Int as uint8;
    m: Int as int64;
    flag: Bool;
    message: String;

    init() {
        self.n = 0;
        self.m = 0;
        self.flag = false;
        self.message = "";
    }
}