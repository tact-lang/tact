/// Comprehensive testing of asm functions: testing TVM instructions in assembly functions, parameter flattening, and arrangements.

// Test snippet 1: Basic asm function using a TVM instruction
asm fun answer(): Int { 42 INT }

fun main1() {
    let a = answer();
}

// Test snippet 2: Using parameter in an asm function, parameters are flattened
asm fun parameterEcho(x: Int): Int { x }

fun main2() {
    let y = parameterEcho(10);
}

// Test snippet 3: Primitive without accompanying TVM instruction (expected compile error)
// Uncommenting the function below should yield a compilation error
// asm fun badPrimitive(): Int { 43 }

// Test snippet 4: Function using a flattened struct as parameter
struct AB { a: Int; b: Int }
asm fun sumAB(two: AB): Int { ADD }

fun main3() {
    let res = sumAB(AB{ a: 27, b: 50 });
}

// Test snippet 5: Using return arrangement
asm fun push42(): Int { 42 PUSHINT }

fun main4() {
    let v = push42();
}

// Test snippet 6: Testing return capturing with a flattened struct via return arrangement
struct Pair { first: Int; second: Int }

// In absence of explicit parameter arrangement:
//  - When calling swapPair, the Pair is flattened as: s1 = first, s0 = second
//  - The return arrangement (-> 1 0) will capture s1 for the first field and s0 for the second field,
//    effectively swapping the values in the resulting Pair.
asm(-> 1 0) fun swapPair(pair: Pair): Pair { }

fun main5() {
    let original = Pair { first: 10, second: 20 };
    let swapped = swapPair(original);
    // Expected: swapped.first == 20, swapped.second == 10
}

// Test snippet 7: Testing TVM instruction case sensitivity and quotes
asm fun goodInstruction(): Cell { MYCODE }
// asm fun badInstruction1(): Cell { mycode }  // Expected compile error
// asm fun badInstruction2(): Cell { "MYCODE" }  // Expected to push string, not actual TVM code

fun main6() {
    let _ = goodInstruction();
}

// Test snippet 8: Testing use of a TVM instruction that consumes a primitive automatically
asm fun discardTwo(a: Int, b: Int) { DROP2 }

fun main7() {
    discardTwo(1, 2);
}
