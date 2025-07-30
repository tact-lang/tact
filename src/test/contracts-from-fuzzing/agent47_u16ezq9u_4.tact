/* Test 4: Constant arithmetic evaluation */
const CONST_A: Int = 10;
const CONST_B: Int = 20;
const CONST_SUM: Int = CONST_A + CONST_B;

contract Test {
    get fun getSum(): Int {
        return CONST_SUM;
    }
    
    receive() {}
}
