contract TestContract {
    optStr: String?;

    init() {
        self.optStr = null;
    }

    receive() {
        self.optStr = "hi";
    }
}