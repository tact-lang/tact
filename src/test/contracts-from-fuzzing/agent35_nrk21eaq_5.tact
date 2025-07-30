// Initial fuzz testing cycle
// Already tested arithmetic operator precedence, if-else statement, and boolean condition evaluation.
// Proceeding with additional feature checks based on Tact documentation.

// 1. Testing comparison operators with integers - normal and boundary cases.
contract CompareTest {
    fun compare(a: Int, b: Int): Bool {
        // Documentation specifies that a == b checks for equality
        // and a != b checks for inequality. a < b etc should work as expected.
        if (a == b) {
            return true;
        } else if (a < b) {
            return true;
        } else {
            return false;
        }
    }

    receive() {
        // Force compilation by calling the function
        self.compare(5, 5);
    }
}
