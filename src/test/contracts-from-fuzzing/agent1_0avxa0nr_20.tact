contract NestedTryDiscard {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Function that performs a nested try-catch with discarded error parameter
    fun nested() {
        try {
            throw(500);
        } catch (_) {
            self.counter = self.counter + 10;
        }
    }

    // Function with nested try-catch that rethrows modified error codes
    fun another() : Int {
        try {
            try {
                throw(300);
            } catch (e1) {
                // Rethrow with modified exit code
                throw(e1 + 1);
            }
        } catch (e2) {
            return e2;
        }
    }

    get fun getCounter() : Int {
        return self.counter;
    }
}
