contract BitwiseTest {
    fun test(): Int {
        let five = 5;
        // Evaluate bitwise NOT then negation: -(~5) should be 6
        return -(~five);
    }

    receive() {
        let result = self.test();
        result;
    }
}
