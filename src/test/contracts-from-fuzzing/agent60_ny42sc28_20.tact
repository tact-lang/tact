struct Pair2 {
    first: Int;
    second: Int;
}

// Assembly function that swaps two integers using a return arrangement
asm(a b -> 1 0) fun asmSwap(a: Int, b: Int): Pair2 {
    SWAP
}

contract AssemblyFuzzTest {
    // Call the asmSwap assembly function and check its result
    fun testSwap(): Int {
        let p: Pair2 = asmSwap(5, 10);
        // Expected: p.first should be 10, p.second should be 5
        return p.first - p.second;  // expected result 5
    }

    // Getter to expose the result of testSwap
    get fun getSwapResult(): Int {
        return self.testSwap();
    }
}
