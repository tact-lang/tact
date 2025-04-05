contract ArithmeticTest {
    fun test(): Int {
        let five = 5;
        let four = 4;
        // Expression: (five + (four - five)) * four / (five % four)
        // Calculation: (5 + (4 - 5)) = 4, then 4 * 4 = 16, and 5 % 4 = 1, so result = 16
        return (five + (four - five)) * four / (five % four);
    }

    receive() {
        self.test();
    }
}
