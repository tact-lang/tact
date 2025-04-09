/// Comprehensive testing cycle for asm functions in Tact

// Test A: Basic asm function with TVM instructions (PUSHINT usage)
asm fun answer(): Int { 42 INT }

fun main_A() {
    // Expect 42
    answer();
}

// Test B: Use parameter as direct return (identity)
asm fun identity(x: Int): Int { x }

fun main_B() {
    identity(100);
}

// Test C: Invalid primitive usage without accompanying instruction
// This snippet is expected to produce a compilation error as documented, so we comment it out
/*
asm fun bad(): Int { 43 }

fun main_C() {
    bad();
}
*/

// Test D: Flattening of a simple struct parameter
struct AB { a: Int; b: Int }

// This asm function will add the two fields from the struct AB
asm fun sumAB(two: AB): Int { ADD }

fun main_D() {
    let two = AB { a: 27, b: 50 };
    sumAB(two);
}

// Test E: Assembly function with return rearrangement to swap values in a struct
struct Pair { first: Int; second: Int }

// Parameters are pushed in order: first then second, so initially stack: [a, b]
// The 'asm(-> 1 0)' rearrangement swaps the two values before capturing them in Pair,
// so Pair.first will be original second and Pair.second will be original first.
asm(-> 1 0) fun swapPair(a: Int, b: Int): Pair { NOP }

fun main_E() {
    let p = swapPair(3, 10);
    // Expected: p.first = 10, p.second = 3, so difference 10 - 3 = 7
    p.first - p.second;
}

// Test F: Assembly function using the 'extends' attribute
// For extends functions, first parameter must be named "self"
asm extends fun extAdd(self: Int, y: Int): Int { ADD }

fun main_F() {
    // Called as an extension function
    10.extAdd(5);
}

// Test G: Nested struct parameter flattening
struct NestedAB { first: AB; second: AB }

// For NestedAB, flattening order: first.a, first.b, second.a, second.b
// Our goal: sum all four numbers. With initial stack [first.a, first.b, second.a, second.b]
// We perform three ADD operations to sum them: ADD; ADD; ADD yields the total sum
asm fun sumNested(n: NestedAB): Int { 
    ADD; // adds second.a and second.b, stack becomes: [first.a, first.b, sum2]
    ADD; // adds first.b and sum2, stack becomes: [first.a, sum3]
    ADD  // adds first.a and sum3, yielding total sum
}

fun main_G() {
    // Sum: 1+2+3+4 = 10
    sumNested(NestedAB { first: AB { a: 1, b: 2 }, second: AB { a: 3, b: 4 } });
}

// Test H: Assembly function using 'mutates' and 'extends' attributes
// Define a decrement function as an extension method
asm mutates extends fun dec(self: Int): Int { 1 SUB }

fun main_H() {
    // Called as extension function: 10.dec() should yield 9
    10.dec();
}

// Test I: Using the 'inline' attribute (has no effect but should compile)
asm inline fun inlineTest(x: Int): Int { x }

fun main_I() {
    inlineTest(123);
}

// Test J: Assembly function without a return type
// When no return type is specified, the assembly function does not capture any stack value
asm fun noReturn() { DROP }

fun main_J() {
    noReturn();
    // Return 0 for main function completion
    0
}

// Test K (Commented Out): Invalid return arrangement
// This should fail because the function returns a single value but the rearrangement mentions two positions
/*
asm(-> 0 1) fun invalidArrange(): Int { NOP }

fun main_K() {
    invalidArrange();
}
*/

// Entry point: call a selection of tests to ensure overall compilation
fun main() {
    let a = answer();            // Test A
    let i = identity(100);         // Test B
    let d = sumAB(AB { a: 27, b: 50 }); // Test D
    let s = swapPair(3, 10);       // Test E
    let e = 10.extAdd(5);          // Test F
    let n = sumNested(NestedAB { first: AB { a: 1, b: 2 }, second: AB { a: 3, b: 4 } }); // Test G
    let d2 = 10.dec();             // Test H
    let inl = inlineTest(123);     // Test I
    main_J();                    // Test J
    a + i + d + s.first + s.second + e + n + d2 + inl
}
