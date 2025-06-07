/// Extended Fuzz-Test Suite for asm functions: Final Combined Suite

// The following source combines multiple asm function tests based on our extended fuzzing.
// Some functions are intentionally written to trigger compile-time errors according to spec,
// while others are valid. We expect that:
// • Functions that violate rules (e.g. missing arrangement for parameters, using control-flow constructs
//   in asm bodies, non-uppercase instructions, unconsumed literals) will yield proper compile-time errors.
// • Well-formed functions (e.g. nested struct flattening, correct arrangement) compile without error.

// ----- Valid Tests -----

// 1. Correct handling of nested struct flattening: Level3 -> computes sum: x + y + z + w
struct Level1 { x: Int; y: Int }
struct Level2 { inner: Level1; z: Int }
struct Level3 { level: Level2; w: Int }

asm fun sumLevel3(param: Level3): Int {
    // Push order after flattening: level.inner.x, level.inner.y, level.z, w (w is top-of-stack).
    ADD      // adds (level.z + w)
    SWAP
    ADD      // adds level.inner.y + (level.z+w)
    SWAP
    ADD      // adds level.inner.x + (level.inner.y+level.z+w)
}

// 2. Correct parameter arrangement using rearrangeFour: parameters arranged as (d b a c)
// For inputs (a, b, c, d), this function computes the sum a+b+c+d with a specific series of swaps and adds.

asm(d b a c) fun rearrangeFour(a: Int, b: Int, c: Int, d: Int): Int {
    // After arrangement, stack: bottom: d, b, a, top: c.
    SWAP        // Swap top two: c and a => stack: d, b, c, a
    ADD         // Adds a + c -> stack: d, b, (a+c)
    SWAP        // Swap top two: (a+c) and b -> stack: d, (a+c), b
    ADD         // Adds (a+c) + b -> stack: d, (a+b+c)
    SWAP        // Swap: bring d on top -> stack: (a+b+c), d
    ADD         // Final add: (a+b+c) + d
}

// ----- Invalid Tests (expected compile errors) -----

// 3. extraPrimitiveFail: literal not immediately consumed
asm fun extraPrimitiveFail(): Int {
    123    // literal not consumed immediately
    PUSHINT
}

// 4. missingArrange: parameter arrangement does NOT include all parameters (should produce error)
// The following is intentionally erroneous: function has 3 parameters but arrangement mentions only 2 (a and b).
// Uncommenting will result in compile-time error.
// asm(a b) fun missingArrange(a: Int, b: Int, c: Int): Int {
//     a PUSHINT
//     b PUSHINT
//     c PUSHINT
//     ADD ADD
// }

// 5. loopInAsm: using Tact control-flow (repeat) inside an asm body, which is disallowed.
asm fun loopInAsm(): Int {
    repeat (3) { 1 PUSHINT }
    ADD
}

// 6. caseSensitivityFail: using a lowercase TVM instruction
asm fun caseSensitivityFail(): Int { 42 pushint }


// ----- Main function (calling only valid tests) -----
fun main() {
    let s = sumLevel3(Level3 { level: Level2 { inner: Level1 { x: 1, y: 2 }, z: 3 }, w: 4 }); // Expected: 1+2+3+4 = 10
    let r = rearrangeFour(10, 20, 30, 40); // Expected: 10+20+30+40 = 100 (computed via our swap sequence)
    // We do not call the intentionally invalid functions.
}
