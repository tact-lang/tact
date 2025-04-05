const FROZEN: Int = 10 * 5 + 3;

contract TestCalc {
    get fun getConst(): Int {
        // Expected compile-time evaluation: FROZEN == 53, so 53/2 == 26
        return FROZEN / 2;
    }
}
