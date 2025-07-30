contract ExprTest {
    fun test(): Int {
        // Ternary operator: false ? 1 : (false ? 2 : 3) should evaluate to 3
        return false ? 1 : (false ? 2 : 3);
    }

    receive() {
        let result = self.test();
        result;
    }
}
