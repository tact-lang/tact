contract TestTon {
    // Test constant evaluation of ton function
    // Expected: ton("0.5") returns 500000000 (half a Toncoin)
    const B: Int = ton("0.5");

    receive() {
        let x: Int = self.B;
        require(x == 500000000, "Incorrect ton constant");
        cashback(sender());
    }
}
