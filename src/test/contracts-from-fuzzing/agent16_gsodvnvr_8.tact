contract RequireTest {
    get fun test() : Int {
        // This function tests the require() behavior, by triggering it and catching the error
        try {
            require(false, "Failure test");
        } catch (e) {
            // Return the caught exit code
            return e;
        }
        // If require did not fail (which is unexpected), return 0
        return 0;
    }

    // Minimal receive fallback
    receive() {
       cashback(sender());
    }
}
