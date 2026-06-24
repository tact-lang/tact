contract TestShortCircuit() {
    fun f(): Bool {
        dump(999); // should not be executed if short-circuit works
        return true;
    }

    fun test() {
        // Since the first operand is false, the second operand self.f() should not be evaluated.
        let b = false && self.f();
        dump(b); // expecting false only
    }

    receive() {
        self.test();
    }
}
