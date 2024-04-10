contract TryCatchTester {
    receive() {}

    get fun testTryCatch1(): Int {
        try {
            throw(101);
            return 42;
        }
        return 7;
    }

    get fun testTryCatch2(): Int {
        try {
            throw(101);
            return 42;
        } catch (e) {
            return e;
        }
        return 0;
    }

    get fun testTryCatch3(): Int {
        try {
            let xs: Slice = beginCell().storeUint(0, 1).endCell().beginParse();
            let x: Int = xs.loadUint(1);
            try {
                throw(101);
            } catch (e) {
                return e / x; // division by zero, exit code = 4
            }
            let e: Int = 123;
            return e;
        } catch (e) {
            return e;
        }
    }
}
