message DivTest {
    denom: Int;
}

contract TestTryCatchDivZeroDynamic {
    // This test checks runtime error handling with a division by zero that occurs from a non-constant expression.
    // The denominator is taken from the DivTest message. If it is zero, the division should trigger an exception,
    // and the catch block should capture the exit code.
    fun test(denom: Int) {
        try {
            let a = 42 / denom;
            dump(a);
        } catch (e) {
            // Dump the error exit code. The specific exit code is runtime-dependent but should be non-zero.
            dump(e);
        }
    }

    // Receive a DivTest message, extract its 'denom' field, and pass it to the test function.
    receive(msg: DivTest) {
        self.test(msg.denom);
    }
}
