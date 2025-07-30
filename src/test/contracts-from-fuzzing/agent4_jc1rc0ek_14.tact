struct Pair {
    first: Int;
    second: Int;
}

// Assembly function to swap two integer arguments using arrangement: input order (a, b) becomes output order (b, a)
asm(a b -> 1 0) fun asmSwap(a: Int, b: Int): Pair { SWAP }

contract TestAssemblySwap {
    receive() {
        let pr: Pair = asmSwap(10, 20);
        // After swap, first should contain 20, and second should contain 10
        dump(pr.first);  // Expected: 20
        dump(pr.second); // Expected: 10
    }
}
