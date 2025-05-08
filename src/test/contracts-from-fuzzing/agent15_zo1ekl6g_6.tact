contract DeepControlFlow {

    // Function testing nested branches and try-catch
    fun testNestedBranches(x: Int, y: Int): Int {
        try {
            if (x > y) {
                throw(10);
            } else if (x == y) {
                return 100;
            } else {
                return 200;
            }
        } catch (e) {
            // Nested try-catch in catch branch
            try {
                if (y == 0) {
                    throw(20);
                }
                return e + 50;
            } catch (err) {
                return err;
            }
        }
    }

    // Function testing a try block without a catch clause (if no error is thrown execution continues normally)
    fun testTryNoCatch(x: Int): Int {
        try {
            if (x < 0) {
                throw(5);
            }
        }
        return x;
    }

    // Recursive function to simulate a loop
    fun recursiveLoop(i: Int, limit: Int): Int {
        if (i >= limit) {
            return 0;
        } else {
            return i + self.recursiveLoop(i + 1, limit);
        }
    }

    // Receiver-level control flow testing
    receive(message: String) {
        if (message == "loop") {
            dump(self.recursiveLoop(0, 3)); // Expected dump: 0 + 1 + 2 = 3
            return;
        } else {
            try {
                if (message == "error") {
                    throw(555);
                }
            } catch (e) {
                dump(e);
            }
            return;
        }
    }
}
