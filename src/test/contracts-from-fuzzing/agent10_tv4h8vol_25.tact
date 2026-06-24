contract NestedTryTest {
    receive() {
        try {
            let xs: Slice = beginCell().storeUint(0, 1).endCell().beginParse();
            let x: Int = xs.loadUint(1); // x = 0
            try {
                throw(101);
            } catch (err) {
                // This will perform division by zero, causing an integer overflow (exit code 4)
                dump(err / x);
            }
        } catch (err) {
            // Catching the error from the division by zero
            dump(err);
        }
    }
}
