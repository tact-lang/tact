contract TestShortCircuit {
    // f() with a side effect; should only be called if first operand does not short-circuit the && expression.
    fun f(): Bool {
        dump(999); // side effect, should not trigger if short-circuit works
        return true;
    }

    receive() {
        let r: Bool = false && self.f();
        dump(r); // expected: false; if short-circuit evaluation is in place, dump(999) should not be executed
    }
}
