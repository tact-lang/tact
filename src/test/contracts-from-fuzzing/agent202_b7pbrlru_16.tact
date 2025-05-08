contract PersistBoolInt {
    flag: Bool;
    count: Int;
    init() {
        self.flag = true;
        self.count = 100;
    }
    receive() {
        if (self.flag) {
            self.count += 1;
        }
    }
}