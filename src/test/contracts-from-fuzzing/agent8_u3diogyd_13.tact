trait LoopTrait {
    // A function that sums 1 for each repetition up to n
    fun loopTest(n: Int): Int {
        let sum: Int = 0;
        repeat (n) {
            // In each iteration, add 1
            sum += 1;
        }
        return sum;
    }
}

contract LoopContract() with LoopTrait {
    receive() {
        let r = self.loopTest(5); // Expected: 5
        dump(r);
        cashback(sender());
    }
}
