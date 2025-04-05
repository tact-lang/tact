contract TestTonArithmetic {
    // Contract-level constant: testing arithmetic on compile-time evaluated ton() values
    const sum: Int = ton("1") + ton("1"); // Expected to evaluate to 2000000000

    receive() {
        require(self.sum == 2000000000, "ton arithmetic evaluation incorrect");
    }
}
