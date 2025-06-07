struct Pair { first: Int; second: Int }

// Assembly function must be defined at module-level, not within a contract
asm(a b -> 1 0) fun swap(a: Int, b: Int): Pair { SWAP }

contract TestSwap {
    fun test(): Pair {
         return swap(5, 10);
    }
}
