contract ConstEvalArithmeticTest {
    // Testing arithmetic with built-in compile-time functions:
    // ton("1") yields 1000000000 nanoToncoins, so:
    // ton("1") * 2 + ton("0.5") should equal 2500000000
    const T: Int = ton("1") * 2 + ton("0.5");

    fun test() {
         require(self.T == 2500000000, "Arithmetic constant evaluation failed");
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
