contract ExprSelfTest {
    const MY_CONST: Int = 42;

    fun testSelf() {
        // Accessing a contract-level constant through 'self'
        let s: String = self.MY_CONST.toString();
        dump(s); // should output "42"
    }

    receive() {
        self.testSelf();
    }
}
