/// Test 1: Global Bool Constant
const MY_BOOL: Bool = true;

contract TestBool {
    receive() {
        if (MY_BOOL) {
            // Do nothing
        }
    }
}
