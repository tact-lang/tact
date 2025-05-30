fun complexTryTest(): Int {
    try {
        let xs: Slice = beginCell().storeUint(0, 1).endCell().beginParse();
        let x: Int = xs.loadUint(1); // this should be 0
        try {
            throw(101);
        } catch (err) {
            return err / x; // division by zero, will throw with exit code 4
        }
    } catch (err) {
        return err; // catches the exit code from the inner try block
    }
}
