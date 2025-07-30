contract TestSelfLiteral {
    const TEST: Int = 42;

    fun showcase() {
        // Use the 'self' literal to reference a contract-level constant
        dump(self.TEST); // expected output: 42
    }
}
