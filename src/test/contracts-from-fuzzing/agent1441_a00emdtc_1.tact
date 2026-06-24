contract TestContract {
    val1: Int = 1;
    val2: Bool = true;

    init() {
        self.val1 = 42;
        self.val2 = false;
    }

    receive() {
        self.val1 = self.val1 + 1;
    }
}