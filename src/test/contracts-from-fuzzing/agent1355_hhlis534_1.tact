contract TestContract {
    optStr: String?;
    flag: Bool = false;
    count: Int = 0;

    init() {
        self.optStr = null;
        self.flag = true;
        self.count = 42;
    }

    receive() {
        // no-op
    }
}