// Extended Fuzz Testing: Exploring Additional Edge Cases in asm Functions

// 1. Nested structure flattening: Sum all fields of a nested structure
struct Inner { a: Int; b: Int }
struct Outer { i1: Inner; i2: Inner }

// The flattening order for Outer is: i1.a, i1.b, i2.a, i2.b
// Using three ADD instructions should sum all four values: (((i1.a + i1.b) + i2.a) + i2.b)
asm fun sumNested(o: Outer): Int { ADD ADD ADD }

// 2. Stress test: Combining several TVM instructions in a single asm function
// This function uses DUP, PUSHINT, ADD, SWAP, and DROP. Its logic is arbitrary, focusing on chain stack manipulations.
asm fun stressTest(x: Int): Int {
    DUP         // duplicate x; stack: x, x
    1 PUSHINT   // push constant 1; stack: x, x, 1
    ADD         // add top two: x + 1; stack: x, (x+1)
    SWAP        // swap: (x+1), x
    ADD         // add: (x+1) + x = 2*x + 1; stack: (2*x+1)
    DROP        // drop the result, leaving an empty stack; note: if captured, might cause underflow, but no return capture
}

// 3. Multiple Operations: A more complex manipulation combining DUP and arithmetic operations
// For demonstration, duplicate the parameter twice, add some, then subtract:
asm fun multipleOps(x: Int): Int {
    DUP         // stack: x, x
    DUP         // stack: x, x, x
    ADD         // add top two: x + x = 2*x; stack: x, 2*x
    ADD         // add: x + 2*x = 3*x; stack: 3*x
    SWAP        // swap doesn't change with one element; included for testing SWAP in trivial conditions
    SUB         // subtract: (dummy op, effectively returns 3*x as no second operand) 
    // Note: This subtraction is ambiguous if there's not two operands; however, it's intended to test error messages.
}

// 4. Testing pushing a border constant via PUSHINT (within normal range)
asm fun pushLimits(): Int { 10 PUSHINT }

// 5. Inline asm function returning a constant
asm inline fun inlineConst(): Int { 99 PUSHINT }

// 6. Using DEPTH instruction to retrieve stack depth
asm fun usingDEPTH(x: Int): Int { DEPTH }

// 7. A valid function that uses an empty body to return its parameter (identity function)
asm fun identity(x: Int): Int { }

// Entry point for testing these functions
fun main() {
    let s = sumNested(Outer{ i1: Inner{ a:10, b:20 }, i2: Inner{ a:30, b:40 } }); // Expected result 10+20+30+40 = 100
    let i = identity(55);  // Expected 55
    let l = pushLimits();  // Expected 10
    let c = inlineConst(); // Expected 99
    let d = usingDEPTH(0); // DEPTH value depends on TVM init + parameters
    // stressTest and multipleOps are designed for testing internal stack manipulation; 
    // they may not return expected arithmetic results and potentially leave stack discrepancies if executed.
    let t = stressTest(5);
    let m = multipleOps(5);
}
