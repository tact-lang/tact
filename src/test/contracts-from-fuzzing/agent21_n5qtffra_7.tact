struct Pair { first: Int; second: Int }

// Test 11: Combined argument and return arrangement with a struct return type
asm(a b -> 1 0) fun swapPair(a: Int, b: Int): Pair { SWAP }

// Test 13: Nested Struct Flattening
struct A { a: Int }
struct Nested { x: A; y: A }

// The parameter 'n' is flattened to two Int values (A.a from x and y). The ADD should yield their sum.
asm fun addNested(n: Nested): Int { ADD }

// Test 17: Using the inline attribute with an asm function
asm inline fun inlineTest(x: Int): Int { DUP }

// Test 18: Using the extends attribute with an asm function
// Note: For extends functions, the first parameter must be named "self" and invoked as a method.
asm extends fun variant(self: Int): Int { DUP }

// Test 19: Using the mutates attribute with an asm function (together with extends)
asm mutates extends fun mutTest(self: Int): Int { INC }

// Test 22: Pushing extra primitives before ADD
// Parameter x remains on the stack but is not captured, while 1 and 2 are pushed and ADD yields 3.
asm fun extraPrim(x: Int): Int { 1 PUSHINT 2 PUSHINT ADD }

fun main() {
    let p = swapPair(10, 20);
    let n = addNested(Nested { x: A { a: 5 }, y: A { a: 7 } });
    let i = inlineTest(10);
    let v = 30.variant();
    let m = 5.mutTest();
    let extr = extraPrim(10);
}
