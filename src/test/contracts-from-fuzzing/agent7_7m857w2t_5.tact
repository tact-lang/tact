struct AB { a: Int; b: Int }

asm fun basicAsm(): Int { 42 PUSHINT }

// Identity asm function with empty body. It simply captures the top of the stack (the parameter) without modification.
asm fun identity(x: Int): Int { }

// Swap the two parameters and add them. The parameters are pushed as [a, b] (with a at the bottom, b at the top).
// After SWAP, the order becomes [b, a], then ADD produces (b + a).
asm fun swapTest(a: Int, b: Int): Int { SWAP ADD }

// Returns the current TVM stack depth. Useful for debugging in asm context.
asm fun depthFun(): Int { DEPTH }

// Add the two fields of the struct AB. The fields are flattened on the stack: a is pushed first, b second, so the top of the stack is b, then a.
// The ADD instruction adds them up.
asm fun addStruct(ab: AB): Int { ADD }

// Define a simple struct to test capturing multiple return values.
struct MinMax { minVal: Int; maxVal: Int }

// Use the MINMAX TVM instruction, which is assumed to capture two values from the stack and map them to a struct.
asm fun minmax(a: Int, b: Int): MinMax { MINMAX }

fun main() {
    let r1 = basicAsm();              // Expected: 42
    let r2 = identity(100);             // Expected: 100
    let r3 = swapTest(5, 10);           // Expected: 5 + 10 = 15 (order swap doesn't change sum)
    let r4 = depthFun();              // Expected: some integer representing stack depth (>= number of initial values)
    let r5 = addStruct(AB{ a: 20, b: 30 }); // Expected: 20 + 30 = 50
    let mm = minmax(40, 50);            // Expected: mm.minVal = 40, mm.maxVal = 50 (captured from the stack)

    // The results are not printed but compiled successfully to test asm functions behavior.
}
