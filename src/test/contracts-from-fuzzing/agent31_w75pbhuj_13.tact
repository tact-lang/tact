contract TestTernary() {
    // This constant uses the ternary operator, which is right-associative.
    // The expected result is 2 because the expression false ? 1 : 2 will evaluate to 2.
    const result: Int = false ? 1 : 2;

    get fun getResult(): Int {
        return self.result;
    }
}
