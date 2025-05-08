contract TestContract {
    val1: Int = 1;
    val2: Int = 2;
    val3: Int = 3;

    receive() {
        let _ = self.val1 + self.val2 + self.val3;
    }
}