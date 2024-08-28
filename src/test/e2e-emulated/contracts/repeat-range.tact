contract RepeatRange {
    /// Effective range counter
    effCounter: Int = 0;

    /// To handle deployment
    receive() {}

    /// from -2^{256} to 0, including both ends
    get fun testIgnoredRange(): Int {
        let counter = 0;

        repeat ((-pow(2, 255)) * 2) { counter += 1 }
        repeat (-1) { counter += 1 }
        repeat (0) { counter += 1 }

        return counter; // 0, if things go right
    }

    /// from 2^{31} to +∞ — repeat range is too big
    get fun testInvalidRange(): Int {
        let caseCounter = 0;

        try {
            repeat (pow(2, 31)) { caseCounter -= 1 }
        } catch (_) { caseCounter += 1 }

        return caseCounter; // 1, if things go right
    }

    /// from 1 to 2^{31} - 1, including both ends
    receive("effectiveRange") {
        self.effCounter = 0;

        repeat (1) { self.effCounter += 1}
        repeat (pow(2, 31) - 1) { self.effCounter += 1}
    }

    get fun effectiveRangeCounter(): Int {
        return self.effCounter; // 2^{31}, if ran after receiving "effectiveRange" msg
    }
}
