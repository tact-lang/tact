contract TestContract {
    val1: Int = 0;
    val2: Bool = false;

    init() {
        self.val1 = 42;
        self.val2 = true;
    }

    receive() {
        self.val1 = 7;
    }
}