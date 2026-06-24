contract TestShortCircuitNonConst {
    counter: Int = 7;

    fun errorFun(): Int {
        // This function, if actually executed, would cause a division by zero (7 / (7-7))
        return self.counter / (self.counter - self.counter);
    }

    receive() {
        // Short-circuit evaluation: the right-hand side of && and || should not be evaluated if not necessary
        let a: Bool = false && (self.errorFun() == 0);
        let b: Bool = true || (self.errorFun() == 0);
        dump(a); // Expected output: false
        dump(b); // Expected output: true
    }
}
