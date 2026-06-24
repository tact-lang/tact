contract TestContract {
    num: Int;
    flag: Bool;

    init() {
        self.num = 123;
        self.flag = true;
    }

    get fun values(): Int {
        if (self.flag) {
            return self.num;
        } else {
            return -1;
        }
    }
}