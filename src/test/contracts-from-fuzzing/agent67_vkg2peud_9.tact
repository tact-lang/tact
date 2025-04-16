// Fuzz Test Case 2: OptionalReturnTest
// This function is declared to return an optional Int (Int?) and uses two return statements:
// one returning a value of type Int and one returning null. Expected: Should compile successfully.
contract OptionalReturnTest {
    fun test(a: Int): Int? {
        if (a > 0) {
            return a;
        }
        return null;
    }
}
