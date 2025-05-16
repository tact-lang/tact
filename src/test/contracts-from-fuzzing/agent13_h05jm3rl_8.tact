struct Pair { first: Int; second: Int }

// Swap the order of arguments and return with arrangement: parameters are specified normally but arranged as (b a) and return arrangement swaps stack registers
asm(b a -> 1 0) fun swapArgs(a: Int, b: Int): Pair { MINMAX }

fun test_swapArgs(): Pair {
    return swapArgs(3, 7);
}
