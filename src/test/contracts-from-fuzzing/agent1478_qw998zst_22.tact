contract TestContract {
    flag: Bool;
    count: Int as uint4;

    init() {
        self.flag = true;
        self.count = 15;
    }
}
