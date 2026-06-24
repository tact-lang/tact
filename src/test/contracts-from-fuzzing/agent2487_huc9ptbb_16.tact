contract TestContract {
    counter: Int as uint256;
    flag: Bool;
    message: String?;

    init() {
        self.counter = 0;
        self.flag = true;
        self.message = null;
    }
}