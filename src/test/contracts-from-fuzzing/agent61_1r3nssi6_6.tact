// Test Case 5: Optionals - Non-null assertion on a null value (runtime error handling)
// According to the documentation, using the non-null assertion operator (!!) on a null value
// should cause a runtime error. Here, we catch that error and dump -1 instead.

contract TestOptionalNullAssertion {
    receive() {
        let a: Int? = null;
        try {
            dump(a!!);
        } catch (e) {
            // Expected to catch a runtime error due to null non-null assertion
            dump(-1);
        }
        cashback(sender());
    }
}
