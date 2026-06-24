// Test compilation of getter functions modifying state variables

contract GetterTest {
    x: Int;

    init() {
        self.x = 10;
    }

    // According to documentation, getter functions are not supposed to modify state
    // However, this getter modifies the state variable and compiles successfully.
    get fun modifyAndGet(): Int {
        self.x = self.x + 5;  // modification at runtime
        return self.x;
    }

    // Regular function to check state after getter call
    fun getX(): Int {
        return self.x;
    }
}
