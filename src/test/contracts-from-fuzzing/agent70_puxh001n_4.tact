/* Test 1: Valid arithmetic constant evaluated at compile time */
const computed: Int = (10 * 2) + 5; // expected value: 25

contract ArithmeticTest {
    get fun getComputed(): Int {
        return computed;
    }
}
