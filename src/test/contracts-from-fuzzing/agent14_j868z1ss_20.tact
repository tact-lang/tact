contract NestedTryTest {
    state: Int = 0;
    
    receive("nest") {
        try {
            try {
                self.failingInternal();
            } catch (innerErr) {
                // Inner catch: update state and rethrow with an integer exit code
                self.state = -10;
                throw(42);
            }
        } catch (outerErr) {
            // Outer catch: add the caught exit code to the current state
            self.state = self.state + outerErr;
        }
    }
    
    fun failingInternal() {
        require(false, "Intentional failure");
    }
}
