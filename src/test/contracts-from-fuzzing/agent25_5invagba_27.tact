fun sideEffect(s: String): Bool {
    dump(s);
    return false;
}

contract TestShortCircuit {
    receive() {
        // Test logical OR: left operand true, short-circuit should prevent evaluation of sideEffect
        let r1: Bool = true || sideEffect("should NOT be printed");
        dump(r1); // expected output: true

        // Test logical AND: left operand false, short-circuit should prevent evaluation of sideEffect
        let r2: Bool = false && sideEffect("should NOT be printed");
        dump(r2); // expected output: false

        // Test non-short-circuit cases: left operand false for OR, so sideEffect is evaluated
        let r3: Bool = false || sideEffect("should be printed");
        dump(r3); // expected output: false, and message printed
    }
}
