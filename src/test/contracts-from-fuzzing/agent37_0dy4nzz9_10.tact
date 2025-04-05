const A: Int = ton("1");
const B: Int = ton("1.000");
const C: Int = A - B; // expected to be 0

contract TonPrecision {
    receive() {
        // Use constant C to enforce compile-time evaluation and dead code elimination prevention
        let diff: Int = C;
        cashback(sender());
    }
}
