struct Pair { a: Int; b: Int }

// Assembly function with custom arrangement that swaps the order
// The arrangement 'asm(a b -> 0 1)' means: the first argument is at register a, second at register b,
// and the return values are taken in the order of register 0 and 1 (i.e., they are swapped by the SWAP instruction below).
asm(a b -> 0 1) fun swapExample(a: Int, b: Int): Pair { 
    SWAP
}

contract TestSwap {
    get fun testSwap(): Pair {
         return swapExample(10, 20);
    }
}
