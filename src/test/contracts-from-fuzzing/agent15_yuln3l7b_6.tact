// Extended Fuzz Testing: Further Edge Cases in asm Functions

// 1. Duplicate and Add: Takes an Int parameter, duplicates it on stack, then adds it, returning 2*x
asm fun dupAdd(x: Int): Int { DUP ADD }

// 2. Swap Function with combined arrangement: Using struct Pair for swapping values
struct Pair { first: Int; second: Int }
// 'swap' will reorder parameters: pushed as (a, b) then arrangement '-> 1 0' swaps them.
asm(a b -> 1 0) fun swap(a: Int, b: Int): Pair { } 

// 3. IdentitySwitch: Returns parameters in original order using explicit arrangement
asm(a b -> 0 1) fun identitySwitch(a: Int, b: Int): Pair { }

// 4. Reorder: Returns parameters in reversed order using explicit arrangement on arguments
asm(b a -> 0 1) fun reorder(a: Int, b: Int): Pair { }

// 5. Valid mutates asm function: Using correct 'self' type
// Assuming Slice and Cell are built-ins; LDREF will push two values: Cell and Slice (modified).
asm(-> 1 0) extends mutates fun correctMutates(self: Slice): Cell { LDREF }

// 6. ASM function using DUP and SWAP in a more complex manipulation
// Computes:  x * 3 by doing: duplicate, add, then add x again
asm fun triple(x: Int): Int {
    DUP     // duplicate x, stack: x, x
    ADD     // add them, stack: 2*x
    SWAP    // swap 2*x and x, stack: x, 2*x
    ADD     // add them, result: 3*x
}

// 7. Testing DEPTH in an asm function to check stack manipulation
asm fun checkDepth(x: Int): Int { DEPTH }

// 8. Test empty body with return type (identity-like) - already tested identity above, but redefining for clarity
asm fun identity(x: Int): Int { }

fun testAll() {
    let a = dupAdd(10);       // Expect 20
    let p1 = swap(3, 7);        // Expect Pair { first: 7, second: 3 }
    let p2 = identitySwitch(11, 22); // Expect Pair { first: 11, second: 22 }
    let p3 = reorder(33, 44);   // Expect Pair { first: 44, second: 33 }
    let t = triple(5);          // Expect 15
    let d = checkDepth(100);    // DEPTH value
    let id = identity(123);     // Expect 123
    
    // These function calls are for testing purposes only
}
