contract ReceiverTest {
    v: Int = 0;

    // Receiver with try-catch, testing that changes in try block are rolled back and catch executes
    receive("test") {
        try {
            throw(45);
        } catch (e) {
            self.v = e;
        }
    }

    // Function to test nested try-catch with branching control flow
    fun nestedFlow(b: Bool): Int {
        try {
            if (b) {
                throw(30);
            } else {
                return 100;
            }
        } catch (e) {
            try {
                if (!b) {
                    throw(60);
                } else {
                    return e;
                }
            } catch (e2) {
                return e2;
            }
        }
    }
}
