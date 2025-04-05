// Test 2: Arithmetic constant evaluation
contract ArithmeticConstant {
    // constant arithmetic evaluated at compile time
    const SUM: Int = 10 + 20;

    get fun getSum(): Int {
        return self.SUM;
    }
}
