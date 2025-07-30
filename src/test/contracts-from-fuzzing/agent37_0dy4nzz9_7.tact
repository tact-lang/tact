const HALF: Int = ton("0.5");
const ONE: Int = ton("1");
const SUM: Int = HALF + HALF; // expected to equal ONE (i.e., 1000000000)

contract ConstEvalAdd {
    receive() {
        // We use the constants to avoid dead code elimination.
        // Although we cannot check the values at runtime, the compiler's constant evaluation will ensure these
        // expressions are computed at compile time.
        let _ = SUM;
        cashback(sender());
    }
}
