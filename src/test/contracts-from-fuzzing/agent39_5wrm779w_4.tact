// Test: Valid Optional Usage
// This test validates that an optional value can be correctly used with non-null assertion after assignment.

contract TestOptionalValid {
    fun test() {
        let a: Int? = null;
        // assign a non-null value
        a = 123;
        // Access via non-null assertion
        dump(a!!);
    }
    receive() { self.test(); }
}
