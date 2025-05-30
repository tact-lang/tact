contract TestCond {
    const FLAG: Bool = true;
    
    receive() {
        if (self.FLAG) {
            // dummy branch, compile-time constant condition
        } else {
            // never reached
        }
    }
}
