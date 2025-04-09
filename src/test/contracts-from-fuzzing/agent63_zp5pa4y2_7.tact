contract TestArithmetic {
    // Test constant arithmetic evaluation: compile-time addition
    const SUM: Int = 40 + 2;

    receive() {
         // Use the constant: it should equal 42
         let result: Int = self.SUM;
         if (result == 42) { } else { }
    }
}
