contract Test {
    // Testing compile-time function address(), using a well-known TON address
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");

    // Testing compile-time function cell() with a base64 encoded BoC
    cellValue: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");

    // Standard function to be invoked from receive using self.function
    fun add(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        // Test proper function invocation
        let res: Int = self.add(21, 21);
        // Test receiver with a conditional to check compile-time evaluated value
        if (res == 42) {
            dump(42);
        } else {
            dump(0);
        }
    }
}
