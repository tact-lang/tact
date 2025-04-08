contract NoInit {
    val1: Int;
    val2: String;
    val3: Bool;

    init() {
        self.val1 = 123;
        self.val2 = "abc";
        self.val3 = true;
    }
}