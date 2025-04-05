contract TernaryTest {
    fun test(): Int {
         return false ? 1 : (true ? 2 : 3);
    }

    receive() {
         let res = self.test();
         require(res == 2, "ternary evaluation error: expected 2");
         cashback(sender());
    }
}
