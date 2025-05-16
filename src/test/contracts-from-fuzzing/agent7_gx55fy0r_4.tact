fun testComplexFlow(): Int {
    try {
        if (true) {
            return 99;
        }
        let a: Int = 10; // unreachable code
    } catch (err) {
        // This block would only be reached if an exception occurs
        let a: Int = err;
    }
    // No reachable code to return value; unreachable due to always returning inside try
    return 0;
}

fun returnAfterTry(): Int {
    try {
        // Deliberately not returning
        let a: Int = 5;
    } catch (err) {
        // No return in catch as well
    }
    // This line should be reachable
    return 10;
}

contract ReceiverControl {
    v: Int;

    init() {
        self.v = 0;
    }

    receive("flow") {
        // Combine if condition, try-catch, and return
        if (sender() == myAddress()) {
            try {
                self.v = self.v + 1;
                return; // early exit from receive block if condition met
            } catch (e) {
                self.v = -1;
            }
        } else {
            // Fall-through behavior: no explicit return
            self.v = self.v - 1;
        }
    }
}
