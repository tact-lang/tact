/// Comprehensive Advanced Edge Case Testing for Assembly Functions in Tact

// Test A: Using both parameter and return arrangement without a body
// This function is not called; it's only to test parsing of arrangements.
struct MyPair { a: Int; b: Int }
// Parameters: a, b are pushed in declaration order. Parameter arrangement 'b a' swaps their order on the stack.
// Return arrangement '-> 1 0' then swaps the top two values for MyPair capture.
asm(b a -> 1 0) fun swapPairParams(a: Int, b: Int): MyPair { }

// Test B: Nested structure flattening
struct Inner { x: Int; y: Int }
struct Outer { p: Inner; q: Int }
// Flattening: Outer is flattened to its fields: first inner.x, then inner.y, then q.
// Execution: Stack will be: s0: q, s1: inner.y, s2: inner.x.
// Two ADD instructions will compute: inner.x + inner.y + q.
asm fun flattenSum(o: Outer): Int { ADD ADD }

// Test C: Mutating assembly function
// Mutating asm functions must be extension functions. They are invoked on the instance they mutate.
// This function ignores the original self and returns the constant 42.
asm extends mutates fun asmMutateTest(self: Int): Int { PUSHINT 42 }

// Test D: Using parameter arrangement to reverse subtraction
// Declaration: parameters (a, b) are pushed in order. Arrangement 'b a' swaps their order on the stack,
// so that the TVM instruction SUB (which subtracts s0 from s1) computes: b - a.
asm(b a) fun reverseSub(a: Int, b: Int): Int { SUB }

// Additional valid asm functions tested earlier for arithmetic chain and inline attribute
asm fun addTwoNumbers(): Int { PUSHINT 10 PUSHINT 32 ADD }         // 10 + 32 = 42
asm fun swapSubtract(a: Int, b: Int): Int { SWAP SUB }                  // For (100, 58): 100 - 58 = 42
asm fun getStackDepth(): Int { DEPTH }                                  // Returns current stack depth
asm inline fun inlineExample(): Int { PUSHINT 123 }                    // Should return 123
asm fun sumTriple(t: Triple): Int { ADD ADD }                            // Defined below

struct Triple { a: Int; b: Int; c: Int }  // a+b+c; e.g., 10+20+12=42

asm fun complexChain(): Int { PUSHINT 21 PUSHINT 21 ADD PUSHINT 0 SUB } // (21+21)-0 = 42

// Main function to invoke several asm functions
fun main() {
    // Test flattening with nested structure: Expected 10 + 20 + 12 = 42
    let s: Int = flattenSum(Outer{ p: Inner{ x: 10, y: 20 }, q: 12 });
    
    // Test reverse subtraction: For inputs (a=30, b=72) using arrangement (b a), it computes 72 - 30 = 42
    let r: Int = reverseSub(30, 72);
    
    // Test mutating asm function: invoked as an extension method on an Int
    let m: Int = (999).asmMutateTest();  // Expected: 42
    
    // Test additional valid asm functions:
    let a: Int = addTwoNumbers();           // Expected: 42
    let b: Int = swapSubtract(100, 58);       // Expected: 42
    let i: Int = inlineExample();             // Expected: 123
    let t: Int = sumTriple(Triple{ a: 10, b: 20, c: 12 }); // Expected: 42
    let c: Int = complexChain();              // Expected: 42
    
    // Combine some results to avoid unused warnings
    let total: Int = s + r + m + a + b + i + t + c; // Should sum up to a multiple of 42 and 123
}
