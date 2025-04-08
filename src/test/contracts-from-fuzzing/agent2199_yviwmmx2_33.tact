contract SwapOptional {
    val1: Int?;
    val2: Int?;
    init() {
        self.val1 = null;
        self.val2 = 42;
        let tmp = self.val1;
        self.val1 = self.val2;
        self.val2 = tmp;
    }
}
