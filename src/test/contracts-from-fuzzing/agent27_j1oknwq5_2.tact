/// Test Optional Valid Usage
contract TestOptionals() {
    fun main() {
        // Initialize an optional Int with null and then assign a non-null value
        let op: Int? = null;
        op = 42;
        dump(op!!);  // Should output 42
    }
    receive() { return; }
}
