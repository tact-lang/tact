/* Test 8: Constant ternary operator evaluation */

const ENABLE_FEATURE: Bool = false;
const RESULT: Int = ENABLE_FEATURE ? 100 : 200;

contract Test {
    get fun getResult(): Int {
        return RESULT; // Expected to be 200
    }
    
    receive() {}
}
