contract TestContract {
    val1: Int = 0;
    val2: Bool = true;
    val3: String = "hello";

    init() {
        self.val1 = 123;
        self.val2 = false;
        self.val3 = "world";
    }

    receive() {
        self.val1 = self.val1 + 1;
    }
}