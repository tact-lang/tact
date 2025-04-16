// Test Case 2: Optionals Valid
// This test ensures that a nullable Int can be assigned a non-null value and the non-null assertion operator works correctly.

contract TestOptionalValid() {
    fun run() {
        let opt: Int? = null;
        opt = 123;
        dump(opt!!); // expected output: 123
    }
    receive() {
        self.run();
    }
}
