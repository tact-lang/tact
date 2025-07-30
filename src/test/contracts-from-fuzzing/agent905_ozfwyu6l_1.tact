contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "test";

    init() {
        self.val1 = 42;
        self.val2 = false;
        self.val3 = "changed";
    }
}