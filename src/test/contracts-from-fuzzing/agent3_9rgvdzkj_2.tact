struct Pair { first: Int; second: Int }

// Corrected asm function: We must list the actual parameter names in the rearrangement.
// The function swapPair takes parameters a and b,
// so to reverse their order when pushed onto the stack, we write: asm(b a -> 1 0)
// This means that b is pushed first and a second. Then the function body swaps them with SWAP.
// The return arrangement '-> 1 0' reorders the top two stack elements: the value in s1 becomes top and s0 becomes bottom.
// Hence, after SWAP the order is reversed again. 
// Let's see what Pair gets: when calling swapPair(10, 20), parameters become: a=10, b=20.
// Initially, parameters pushed in the order declared are [10,20] (with 20 at top). But our arrangement makes them pushed as [20,10].
// Then SWAP swaps the top two values, resulting in [10,20].
// Then return arrangement '-> 1 0' rearranges them: s1 becomes the top, s0 becomes bottom, so final stack is [20,10].
// Capturing into Pair: Pair.first gets 20 and Pair.second gets 10.

asm(b a -> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

fun main(): Pair {
    return swapPair(10, 20);
}
