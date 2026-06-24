// Test 1: Constant declared inside contract with compile-time expression

contract ConstantInContract {
    const B: Int = 10 + 20;
    get fun getB(): Int {
        return self.B;
    }
}
