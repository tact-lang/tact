/// Aggregated Valid Asm Functions Edge Case Testing

// Test valid asm function: performing addition with immediate integers. Expected result: 42
asm fun addTwoNumbers(): Int { PUSHINT 10 PUSHINT 32 ADD }

// Test valid asm function: using SWAP to switch two numbers and then subtract.
// The function takes two parameters in the order: a, b. Initially, a is pushed then b. SWAP makes it b, a, so SUB computes a - b.
asm fun swapSubtract(a: Int, b: Int): Int { SWAP SUB }

// Test valid asm function: usage of DEPTH to get the stack depth at the start of the function.
// (Exact returned value may depend on TVM initialization stack state.)
asm fun getStackDepth(): Int { DEPTH }

// Test valid asm function: inline attribute is accepted even though asm functions are always inlined.
asm inline fun inlineExample(): Int { PUSHINT 123 }

// Testing flattening with a nested structure: sumTriple sums the three integers provided by the flattened struct.
struct Triple { a: Int; b: Int; c: Int }
// Order: a pushed first, then b, then c. So stack is: s0: c, s1: b, s2: a. Two ADD operations: first ADD adds c and b, second adds a gives final sum.
asm fun sumTriple(t: Triple): Int { ADD ADD }

// Test using parameter arrangement to swap parameters before multiplication. 
// Declaration: (x, y) with arrangement (x y) is same as natural order, but we include to verify arrangement parsing.
asm(x y) fun multiplySwapped(x: Int, y: Int): Int { MUL }

// Test using an asm function that uses multiple TVM instructions in sequence.
// This function pushes two numbers, adds them, then subtracts 0, returning 42.
asm fun complexChain(): Int { PUSHINT 21 PUSHINT 21 ADD PUSHINT 0 SUB }

// Main function calling all the asm functions to exercise runtime behavior.
fun main() {
    let a: Int = addTwoNumbers();           // Expected: 42
    let b: Int = swapSubtract(100, 58);         // Expected: 42, as 100 - 58 = 42
    let d: Int = getStackDepth();               // Value depends on TVM initialization
    let i: Int = inlineExample();               // Expected: 123
    let t: Int = sumTriple(Triple{ a: 10, b: 20, c: 12 }); // Expected: 10 + 20 + 12 = 42
    let m: Int = multiplySwapped(3, 14);        // Expected: 3 * 14 = 42
    let c: Int = complexChain();                // Expected: 42
}
