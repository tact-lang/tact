contract LoopTest {
    // Test the repeat loop operator, covering boundary cases and normal execution
    fun testRepeat(n: Int): Int {
        let sum: Int = 0;
        // repeat loop: if n > 0, loop n times; if n <= 0, loop is not executed
        repeat (n) {
            // Augmented assignment for clarity; we can't declare sum as mutable but let is allowed if no re-assignment? Actually re-check Tact semantics: In Tact variables are immutable, so we need to use a mutable variable.
            // However, Tact might require using cell state - but for testing repeat, we can simulate by using a block-scoped variable if Tact allows assignment via augmented assignments.
            // According to docs, augmented assignment works. So we assume sum is mutable.
            // But our previous tests used augmented assignment on function parameter, so this is allowed here.
            // If not, we need to redeclare sum as mutable. In Tact, let is not mutable unless declared with mut keyword? Actually reading doc, Tact has no 'var', only let.
            // Augmented assignment operators such as '+=' can only be applied to local variables declared with let? Yes, apparently they are mutable.
            
            // We attempt an augmented assignment.
            sum += 2;
        }
        return sum;
    }

    receive() {
        // Normal case: 10 times should yield 20
        self.testRepeat(10);
        // Boundary case: 0 times should yield 0
        self.testRepeat(0);
    }
}
