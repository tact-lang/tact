struct Triple { first: Int; second: Int; third: Int }

// Test 4: Assembly function with a return arrangement to reverse order of three parameters
// Without any instructions, the TVM stack will initially have: a, b, c (a at bottom, c at top)
// By default, the return captures as: first = a, second = b, third = c, since the last field captures the top.
// With the arrangement (-> 2 1 0), we expect the stack order to be modified so that the captured values become:
// first = c, second = b, third = a.

asm(-> 2 1 0) fun tripleReverse(a: Int, b: Int, c: Int): Triple { }

fun main() {
    let res: Triple = tripleReverse(1, 2, 3);
    // Expected: res.first == 3, res.second == 2, res.third == 1
}
