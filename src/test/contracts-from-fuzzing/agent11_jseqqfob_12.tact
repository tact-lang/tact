// The final comprehensive test snippet for asm functions in Tact

// --- Test 1 ---
// Simple assembly function pushing a constant using PUSHINT as per documentation
asm fun answer(): Int { 42 PUSHINT }

// --- Test 2 ---
// Assembly function pushing a number outside the small range, verifying PUSHINT opcode behavior
asm fun push_big(): Int { 300 PUSHINT }

// --- Test 3 ---
// Assembly function with argument and return arrangements to swap two integers
struct Pair { first: Int; second: Int }
asm(a b -> 1 0) fun swapInts(a: Int, b: Int): Pair { }

// --- Test 4 ---
// Assembly function defined to simply capture the parameter as the return value (identity)
asm fun identity(x: Int): Int { }

// --- Test 5 ---
// Assembly function with unattached primitive, expected to trigger a compile-time error
// This test validates that unattached primitives are disallowed
// Uncommenting this function should yield a compilation error as documented
// asm fun bad(): Int { 43 }

// --- Test 6 ---
// Assembly function with nested structure flattening
struct Inner { a: Int; b: Int }
struct Outer { x: Inner; y: Inner }
// The parameters of Outer flatten to: x.a, x.b, y.a, y.b. The function sums these values using ADD
asm fun sumOuter(o: Outer): Int { ADD ADD ADD }

// --- Test 7 ---
// Assembly function with no return capture; it only manipulates the stack (using DROP)
asm fun noReturn() { DROP }

// --- Test 8 ---
// Assembly function declared as a mutating extension function with correct self parameter
asm mutates extends fun incMutate(self: Int): Int { INC }

// --- Test 9 ---
// Assembly function pushing a negative integer (-1), verifying proper handling of negative constant
asm fun pushNeg(): Int { -1 PUSHINT }

// --- Test 10 ---
// Assembly function using stack operations to double the provided value
asm fun doubleVal(x: Int): Int { x DUP ADD }

// --- Test 11 ---
// Assembly function demonstrating problematic direct parameter reference
// (In asm functions, direct parameter names in the body are treated as TVM instructions,
// so this can lead to ambiguity. The documentation advises against such usage.)
asm fun illegalAccess(x: Int): Int { x ADD }

// --- Main Function for Invocation ---
fun main() {
    // Test 1
    let a = answer();

    // Test 2
    let b = push_big();

    // Test 3: swapInts should swap the two integers
    let p = swapInts(10, 20); // Expected: p.first = 20, p.second = 10

    // Test 4
    let id = identity(123);

    // For Test 5, the function 'bad' is intentionally erroneous and is commented out.

    // Test 6: Sum of nested structure values: 1 + 2 + 3 + 4 = 10
    let s = sumOuter(Outer{ x: Inner{ a: 1, b: 2 }, y: Inner{ a: 3, b: 4 } });

    // Test 7: noReturn manipulates the stack but does not capture a value
    noReturn();

    // Test 8: Mutating extension function called in method form
    let inc = 10.incMutate(); // Expected: 11

    // Test 9
    let neg = pushNeg(); // Expected: -1

    // Test 10
    let doubled = doubleVal(7); // Expected: 14

    // Test 11: illegalAccess will compile but its behavior is ambiguous since 'x' in the body,
    // when not attached to a proper TVM instruction, will be interpreted in an unusual manner.
    let illegal = illegalAccess(5);

    // Silencing warnings
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
