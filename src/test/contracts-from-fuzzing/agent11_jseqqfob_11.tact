// Comprehensive testing of asm functions in Tact

// Test 1: Simple assembly function pushing a constant using PUSHINT
asm fun answer(): Int { 42 PUSHINT }

// Test 2: Assembly function pushing a number outside small range (300) using PUSHINT
asm fun push_big(): Int { 300 PUSHINT }

// Test 3: Assembly function with argument and return arrangements to swap two integers
struct Pair { first: Int; second: Int }
asm(a b -> 1 0) fun swapInts(a: Int, b: Int): Pair { }

// Test 4: Assembly function with identity behavior and proper handling of parameter reference
asm fun identity(x: Int): Int { }

// Test 5: Assembly function having an unattached primitive (should trigger compile-time error)
// (This test is expected to fail per documentation that every primitive must be attached to a TVM instruction)
asm fun bad(): Int { 43 }

// Test 6: Assembly function with nested structure flattening
struct Inner { a: Int; b: Int }
struct Outer { x: Inner; y: Inner }
// Body uses three ADD instructions to combine four values pushed from Outer
asm fun sumOuter(o: Outer): Int { ADD ADD ADD }

// Test 7: Assembly function with no return capture, just manipulating the stack
asm fun noReturn() { DROP }

// Test 8: Assembly function declared as a mutating extension function with correct self parameter
asm mutates extends fun incMutate(self: Int): Int { INC }

// Test 9: Assembly function pushing a negative integer (-1)
asm fun pushNeg(): Int { -1 PUSHINT }

// Test 10: Assembly function using stack operations to double a value
asm fun doubleVal(x: Int): Int { x DUP ADD }

// Test 11: Assembly function using direct reference to parameter inside body (illegal as parameters
// cannot be referenced directly, they are interpreted as TVM instructions). This should compile but
// its body effectively treats the parameter name as a TVM instruction, resulting in an error if that
// instruction is not defined. We simulate this with a custom function that's intentionally ambiguous.
asm fun illegalAccess(x: Int): Int { x ADD }

// Main function invoking the asm functions
fun main() {
    // Test 1
    let a = answer();
    
    // Test 2
    let b = push_big();

    // Test 3: swapInts should swap the two parameters
    let p = swapInts(10, 20); // Expected: p.first = 20, p.second = 10

    // Test 4
    let id = identity(123);

    // Test 6
    let s = sumOuter(Outer{ x: Inner{ a: 1, b: 2 }, y: Inner{ a: 3, b: 4 } }); // Expected: 1+2+3+4 = 10

    // Test 7
    noReturn();

    // Test 8: Mutating extension requires inlined call
    let inc = 10.incMutate(); // Expected: 11

    // Test 9
    let neg = pushNeg(); // Expected: -1

    // Test 10
    let doubled = doubleVal(7); // Expected: 14

    // Test 11
    let illegal = illegalAccess(5);

    // Variable assignments to silence unused variable warnings
    let _ = a;
    let _ = b;
    let _ = p;
    let _ = id;
    let _ = s;
    let _ = inc;
    let _ = neg;
    let _ = doubled;
    let _ = illegal;
}
