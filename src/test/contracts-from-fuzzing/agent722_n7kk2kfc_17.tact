contract ZeroDefault {
    count: Int as uint8 = 0;
    flag: Bool = false;

    init() {
        self.count = 123;
        self.flag = true;
    }
}