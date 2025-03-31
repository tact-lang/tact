// Comprehensive Testing Cycle for Assembly Functions in Tact
// We begin by testing several aspects of the asm functions feature as documented.
// Documentation references include details on TVM instructions, parameter handling, arrangements, and restrictions on direct parameter references.
//
// 1. Basic asm function returning a constant via TVM instruction using PUSHINT:

asm fun answer(): Int { 42 PUSHINT }

// Test entry point calling answer()
fun main_answer() : Int {
    return answer();
}

// 2. Using structured parameters and TVM instruction (ADD) as in the documentation.

struct AB { a: Int; b: Int }

asm fun sum(two: AB): Int { ADD }

fun main_sum() : Int {
    // Expected to compute a sum of the two fields (27 + 50 = 77), though we rely on the TVM ADD behavior
    return sum(AB{ a: 27, b: 50 });
}

// 3. Testing that parameters cannot be directly referenced by name in asm function bodies.
// According to documentation (see file 9 snippet in docs), using the parameter as a TVM instruction should be rejected.
// We use an identically named parameter 'BOC'.

asm fun bocchiThe(BOC: Cell): Cell { BOC }

fun main_bocchi() : Int {
    // We don't actually call bocchiThe because its body should not compile.
    // This snippet is intended to ensure that direct parameter reference is disallowed as per documentation.
    return 0;
}

// 4. Testing an asm function that performs a SWAP on two parameters to examine parameter order manipulation.
// The parameters are pushed in order and then swapped via the SWAP instruction.

asm fun rearrange(a: Int, b: Int): Int { SWAP }

fun main_rearrange() : Int {
    // Initially, stack: [a, b] = [5, 10]. SWAP yields [10, 5]. Capturing top as return gives 5.
    return rearrange(5, 10);
}

// 5. Testing an asm function with combined argument and return arrangement.
// Here, we simulate an arrangement by reordering the two parameters using 'asm(s len -> 1 0)'.
// The body uses SWAP, so effectively the captured return will map the two swapped values into a struct.

struct Pair { a: Int; b: Int }

asm(s len -> 1 0) fun swapPair(len: Int, s: Int): Pair { SWAP }

fun main_swapPair() : Pair {
    // Initially, parameters pushed as: [len, s] = [42, 100].
    // Arrangement 's len' reorders the parameters so that the execution stack is [100, 42].
    // The SWAP then swaps them to [42, 100], and the return arrangement '-> 1 0' captures Pair { a: 42, b: 100 }.
    return swapPair(42, 100);
}

// 6. Testing an asm function with no return type specified.
// According to documentation, an asm function with no return type does not capture any value from the stack.

asm fun push(x: Int) { INC }

fun main_push() {
    // Simply call push; no return value is captured.
    push(10);
}

// 7. Testing a compilation error case where a primitive is left unconsumed after writing it.
// According to the docs, writing a primitive (e.g., number) without a consuming instruction should fail compilation.

asm fun bad(): Int { 43 }

fun main_bad() : Int {
    // This function is not expected to compile successfully, as the asm function 'bad' should produce a compilation error.
    return bad();
}
