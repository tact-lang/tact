contract ControlFlow2 {
    fun nestedTest(x: Int): Int {
        // Outer try block
        try {
            if (x == 0) {
                throw(101);
            }
            // Early return inside try
            return 100;
        } catch (e) {
            // Nested try-catch within catch block
            try {
                if (x == 0) {
                    throw(202);
                }
                return e + 10; // e from outer catch
            } catch (err) {
                return err; // return error from nested catch
            }
        }
    }

    // Receiver-level control flow: receive method with try-catch and branching
    receive(message: String) {
        if (message == "fail") {
            try {
                throw(303);
            } catch (code) {
                // Use return in catch block in receiver; note: this does not exit the contract but short-circuits handling
                return;
            }
        } else {
            // Normal processing
            return;
        }
    }
}
