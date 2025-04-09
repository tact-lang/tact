/// Final comprehensive test file covering several aspects of asm functions and their behavior

// Test 1: Basic TVM instruction usage
asm fun answer(): Int { 42 INT }

fun test1() {
    let a = answer();
}

// Test 2: Parameter echo; parameter flattened as is
asm fun parameterEcho(x: Int): Int { x }

fun test2() {
    let y = parameterEcho(77);
}

// Test 3: Flattened struct parameter usage with arithmetic
struct AB { a: Int; b: Int }
asm fun sumAB(two: AB): Int { ADD }

fun test3() {
    let result = sumAB(AB { a: 27, b: 50 });
    // Expected 77
}

// Test 4: Return arrangement to swap flattened struct fields
// The Pair struct is flattened as: s1 = first, s0 = second
// The return arrangement (-> 1 0) will capture s1 into first, and s0 into second, effectively swapping them
struct Pair { first: Int; second: Int }
asm(-> 1 0) fun swapPair(pair: Pair): Pair { }

fun test4() {
    let original = Pair { first: 10, second: 20 };
    let swapped = swapPair(original);
    // Expected: swapped.first == 20, swapped.second == 10
}

// Test 5: Valid TVM instruction usage ensuring case sensitivity and no quotes
asm fun goodInstruction(): Cell { MYCODE }

fun test5() {
    let _ = goodInstruction();
}

// Test 6: Using an instruction that consumes additional primitives
asm fun discardTwo(a: Int, b: Int) { DROP2 }

fun test6() {
    discardTwo(1, 2);
}

// Test 7: Using PUSHINT with a number outside the small range to ensure correct encoding
asm fun pushLarge(x: Int): Int { x PUSHINT }

fun test7() {
    let val1 = pushLarge(300); // 300 should be encoded with appropriate opcode variant
}
