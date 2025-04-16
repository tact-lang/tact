contract Test {
    // Test constant evaluation of ascii function
    // Expected: ascii("⚡") returns 14850721
    const A: Int = ascii("⚡");

    receive() {
        let x: Int = self.A;
        require(x == 14850721, "Incorrect ascii constant");
        cashback(sender());
    }
}
