contract RepeatTest {
    // This test demonstrates the enforced range of the repeat loop count.
    // As specified, the repeat loop accepts counts in 1 .. 2^31-1.
    // Using an out-of-bound value (e.g., pow(2,55)) should trigger an error with exit code 5 at runtime.
    receive() {
        try {
            // Attempt to repeat an excessively high number: pow(2,55)
            repeat (pow(2,55)) {
                // Empty loop body
            }
        } catch (err) {
            // Dump the caught exit code
            dump(err);
        }
        cashback(sender());
    }
}
