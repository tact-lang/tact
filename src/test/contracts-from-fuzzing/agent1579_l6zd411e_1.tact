contract TestContract {
    num: Int = 1;
    flag: Bool = true;

    init() {
        self.num = 42;
        self.flag = false;
    }

    receive() {
        self.num = self.num + 1;
    }
}