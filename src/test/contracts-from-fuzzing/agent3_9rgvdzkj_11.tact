// This snippet is designed to chain multiple asm functions calls together within a contract to test inter-function interactions.
// We define two asm functions that perform distinct stack manipulations, then compose them in a higher-level function.

struct Triple { a: Int; b: Int; c: Int }

// First asm function: rearranges parameters (x, y, z) to [y, x, z] using -ROT and SWAP
asm fun rearrange(x: Int, y: Int, z: Int): Triple { -ROT SWAP }

// Second asm function: takes a Triple and performs a SHIFT operation; here, we simply duplicate the top element and then drop one element, resulting in a modified triple
// We'll simulate this by using DUP and DROP so that final stack becomes: bottom remains same, middle becomes top duplicated, and top is lost.
// For reproducibility, we design an asm function that simply calls DUP and DROP (these instructions work on the top of the stack)
asm fun modify(tr: Triple): Triple {
    DUP
    DROP
    // This function returns the triple unchanged (for testing composition)
}

// High-level function that composes rearrange and modify
fun composite(x: Int, y: Int, z: Int): Triple {
    // First, call rearrange (stack effect: { a=y, b=x, c=z })
    let t1: Triple = rearrange(x, y, z);
    // Then, call modify on the result
    let t2: Triple = modify(t1);
    return t2;
}

fun main(): Triple {
    // Input: x=5, y=15, z=25, expect rearrange to yield { a=15, b=5, c=25 }
    return composite(5, 15, 25);
}
