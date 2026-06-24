contract Chaining {
    val1: Int;
    val2: Int;
    val3: Int;

    init() {
        self.val1 = 10;
        self.val2 = self.val1 + 5;
        self.val3 = self.val2 + 5;
    }
}