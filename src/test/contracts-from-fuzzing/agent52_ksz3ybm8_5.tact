contract ConstEvalTest {
    // Testing compile-time evaluation of built-in functions: ton
    // ton("0.5") should yield 500000000 nanoToncoins
    // ton("1") should yield 1000000000 nanoToncoins
    const T1: Int = ton("0.5"); // expected 500000000
    const T2: Int = ton("1");   // expected 1000000000
    // Directly compute the sum using built-in function calls
    const Sum: Int = ton("0.5") + ton("1"); // expected 1500000000

    fun test() {
         require(self.T1 == 500000000, "ton(\"0.5\") mismatch");
         require(self.T2 == 1000000000, "ton(\"1\") mismatch");
         require(self.Sum == 1500000000, "Sum of ton(\"0.5\") and ton(\"1\") mismatch");
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
