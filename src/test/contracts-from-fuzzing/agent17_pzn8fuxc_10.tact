// Comprehensive testing cycle for asm functions (final revision without duplicate loadRef)

// Test 1: Basic ASM function that computes a constant value using a TVM instruction
asm fun answer(): Int { 42 PUSHINT }

// Test 2: ASM function with arithmetic operations on stack:
// Push two numbers and add them
asm fun addTwo(a: Int, b: Int): Int { a PUSHINT b PUSHINT ADD }

// Test 3: ASM function with argument arrangement: swap arguments
// Declared as an extension function; invocation must be on the first argument
asm(c self) extends fun swapArgs(self: Int, c: Int): Int { self PUSHINT c PUSHINT ADD }

// Define a struct for return value instead of tuple
struct Pair { a: Int; b: Int }
// Test 4: ASM function with return arrangement, producing a Pair with reversed order
asm(-> 1 0) fun returnSwap2(): Pair { 1 PUSHINT 2 PUSHINT }

// Test 5: ASM function using a TVM instruction with a larger constant value to trigger different opcode behavior
asm fun pushLarge(): Int { 300 PUSHINT }

// Main function to call some of the successful asm functions
fun main(): Pair {
    let a = answer();            // should be 42
    let b = addTwo(10, 32);         // should be 42
    // For extension function, call on first argument
    let c = 5.swapArgs(10);        // should compute 5 + 10 = 15
    let r = returnSwap2();         // Pair with a=2 and b=1 due to swapped return order
    let l = pushLarge();           // should compile pushLarge without runtime error
    // Return result from returnSwap2
    return r;
}
