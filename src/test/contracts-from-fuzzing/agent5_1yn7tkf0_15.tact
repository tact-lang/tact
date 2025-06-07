contract NestedTryCatch {
    s: Int;

    init() {
        self.s = 0;
    }

    receive() {
        try {
            // Prepare x=0 by loading an unsigned integer from a cell
            let xs: Slice = beginCell().storeUint(0, 1).endCell().beginParse();
            let x: Int = xs.loadUint(1); // x becomes 0

            try {
                throw(101);
            } catch (innerErr) {
                // This division by x (which is 0) should trigger a division error (exit code 4)
                let r: Int = 101 / x;
            }
        } catch (outerErr) {
            // Capture the error from the inner try-catch (expected to be exit code 4)
            self.s = outerErr;
        }
    }
}
