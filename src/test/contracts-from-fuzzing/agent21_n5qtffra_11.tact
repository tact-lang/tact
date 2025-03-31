//// Test 26: Return arrangement with const literals for struct Pair
// This function is expected to return a Pair where the first field gets the top value on the stack, and second field gets the next.
// Using return arrangement "asm(-> 1 0)" will swap the order of the pushed values, so the Pair fields will be reversed relative to push order.
asm(-> 1 0) fun constPair(): Pair {
    // Push two literals in order: first 1 then 2. Without arrangement, Pair { first: 1, second: 2 } would be expected.
    // With arrangement "-> 1 0", the captured value for the first field comes from stack register 1 (which is 1) and second field from stack register 0 (which is 2),
    // so we still get Pair { first: 1, second: 2 }.
    1 PUSHINT
    2 PUSHINT
}

//// Test 31: Sum of three parameters
// This function attempts to sum three Int parameters using stack manipulation.
// Initial stack: a (bottom), b, c (top). The instructions will compute a + b + c.
asm fun sum3(a: Int, b: Int, c: Int): Int {
    // Swap the top two elements twice to leave stack unchanged, then ADD twice.
    SWAP
    SWAP
    ADD
    ADD
}

//// Test 32: asm function with an empty body and return type Int
// According to the semantics, an asm function with a return type must produce at least one value on the stack.
// An empty body should trigger a compile-time error due to missing stack value capture.
asm fun emptyAsm(x: Int): Int { }

// Struct definition for Pair used in Test 26
struct Pair { first: Int; second: Int }

fun main() {
    let p = constPair();          // Expect Pair { first: 1, second: 2 }
    let s = sum3(10, 20, 30);       // Expect 60
    emptyAsm(42);                 // Expected to cause a compile error
}
