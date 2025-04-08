contract TestContract {
    flag: Bool;
    count: Int;

    init() {
        self.flag = true;
        self.count = 5;
    }

    receive() {
        self.count = self.count + 1;
    }
}