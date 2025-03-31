// Test Case: Getter with conditional return
contract GetTest {
    get fun get_val(): Int {
        if (true) {
            return 5;
        } else {
            return 6;
        }
    }
}
