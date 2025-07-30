/* Test 4: swapReturn with arrangement (-> 1 0)
   This function swaps the order of its two parameters on the stack.
*/

struct Pair { first: Int; second: Int }

asm(-> 1 0) fun swapReturn(x: Int, y: Int): Pair { SWAP }

fun testSwapReturn() {
    let p = swapReturn(123, 456);
    // Expected: p.first should be 456 and p.second should be 123
}
