struct Triple { first: Int; second: Int; third: Int }

// This asm function takes three parameters a, b, c (pushed in order [a, b, c] with c at top)
// and then rearranges them so that the resulting triple is in reverse order: (c, b, a).
// Explanation:
// Initial stack: bottom=a, then b, then top=c.
// SWAP swaps the top two: resulting stack: [a, c, b].
// -ROT rotates the third element (a) to the top, resulting in: [c, b, a].
// Then the return arrangement uses default capture: the structure Triple captures values from the stack in right-to-left order,
// meaning Triple.first gets bottom (c), Triple.second gets the middle (b), Triple.third gets the top (a).

asm fun tripleReverse(a: Int, b: Int, c: Int): Triple { SWAP -ROT }

fun main(): Triple {
    return tripleReverse(1, 2, 3);
}
