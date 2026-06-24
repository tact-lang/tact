contract TestShortCircuit2 {
    fun unreachable(): Bool { throw(999); }
    receive() {
        // Short-circuit evaluation test: the right-hand side should not be evaluated because of short-circuiting
        let resultOr: Bool = true || self.unreachable();
        let resultAnd: Bool = false && self.unreachable();
        dump(resultOr ? 1 : 0);  // Expected to dump 1
        dump(resultAnd ? 1 : 0); // Expected to dump 0
    }
}
