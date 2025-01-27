contract RepeatRangeTester {
    /// To handle deployment
    receive() {}

    /// from -2^{256} to 0, including both ends
    get fun testIgnoredRange(): Bool {
        let counter = 0;

        repeat ((-pow(2, 255)) * 2) { counter += 1 }
        repeat (-1) { counter += 1 }
        repeat (0) { counter += 1 }

        return counter == 0;
    }

    /// from 2^{31} to +∞ — repeat range is too big
    get fun testInvalidRange(exponent: Int): Bool {
        try {
            let counter = 0;
            repeat (pow(2, exponent)) { counter += 1 }

            return false;
        } catch (exitCode) {
            return exitCode == 5;
        }
    }

    /// from 1 to 2^{31} - 1, including both ends
    get fun testMinEffectiveRange(): Bool {
        let counter = 0;
        repeat (1) { counter += 1 }

        return counter == 1;
    }
    
    /// from 1 to 2^{31} - 1, including both ends
    receive("testMaxEffectiveRange") {
        let counter = pow(2, 31) - 1;

        // This will cause exit code -14 in Compute phase (as expected)
        repeat (pow(2, 31) - 1) { counter += 1 }
    }
}
