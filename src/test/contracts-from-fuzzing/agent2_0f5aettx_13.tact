/* Summary of testing results for asm functions */

// Test 1: Minimal valid asm function compiled successfully
asm fun answer(): Int { 42 PUSHINT }

// Test 2: asm function with no return type compiled successfully
asm fun push(x: Int) { x PUSHINT }

// Test 3: asm function with unconsumed primitive produced expected error
// asm fun bad(): Int { 43 }

// Test 4: asm function with argument and return arrangement compiled successfully
struct SliceInt { s: Slice; val: Int }
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// Test 5: asm function calling DROP2 compiled successfully
asm fun discardTwo(a: Int, b: Int) { DROP2 }

// Test 6: asm function misinterpreting a parameter as an instruction produced expected error
// asm fun badParam(BOC: Cell): Cell { BOC }

// Test 7: Chaining instructions (ADD) compiled successfully
asm fun chain(): Int { 1 PUSHINT 2 PUSHINT ADD }

// Test 8: Subtraction test compiled successfully
asm fun sub(): Int { 3 PUSHINT 2 PUSHINT SUB }

// Test 9: Using PUSHINT with an edge-case number compiled successfully
asm fun pushEdge(): Int { 11 PUSHINT }

// Test 10: asm function with empty body and declared return type produced expected error
// asm fun empty(): Int {  }

// Test 11: asm function with inline attribute compiled successfully
asm inline fun inlineTest(): Int { 42 PUSHINT }

// Test 12: asm function with mutates and extends (with correct parameter naming) compiled successfully
asm mutates extends fun foo(self: Int, a: Int): Int { 42 PUSHINT }

// Test 13: Using DEPTH instruction compiled successfully
asm fun depthTest(): Int { DEPTH }

// Test 14: SWAP and DROP chaining compiled successfully
asm fun stackTest(): Int { 1 PUSHINT 2 PUSHINT SWAP DROP }

// Test 15: Nested struct flattening in parameters compiled successfully
struct AB { a: Int; b: Int }
struct Pair { first: AB; second: AB }
asm fun sumPair(p: Pair): Int { ADD ADD ADD }

// Test 16: Invalid arrangement referencing incorrect parameters produced expected error
// asm(x y -> 1 0) fun invalidArrangement(a: Int): Int { 1 PUSHINT }

// Test 17: Extra primitive not consumed produced expected error
// asm fun extraArgs(): Int { 1 PUSHINT 2 }

// Test 18: Mismatched return type (capturing Int as Cell) produced expected runtime error
asm fun wrongReturn(): Cell { 42 PUSHINT }

// Test 19: Using disallowed attribute 'override' produced expected error
// asm override fun notAllowed(): Int { 42 PUSHINT }

// Test 20: Valid custom arrangement (reordering parameters) compiled successfully
asm(b c a -> 0) fun customRearrange(a: Int, b: Int, c: Int): Int { ADD ADD }

// Test 21: Nested struct flattening with additional struct compiled successfully
struct Inner { x: Int; y: Int }
struct Outer { i: Inner; z: Int }
asm fun flattenTest(o: Outer): Int { ADD ADD }

// Test 22: Multiple SWAP instructions compiled successfully
asm fun repeatSwap(): Int { 1 PUSHINT 2 PUSHINT SWAP SWAP ADD }

// Test 23: Using alias 'INT' instead of 'PUSHINT' compiled successfully
asm fun aliasTest(): Int { 42 INT }

// Test 26: Maximum allowed struct parameter with exactly 16 fields compiled successfully
struct S16 { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; f6: Int; f7: Int; f8: Int; f9: Int; f10: Int; f11: Int; f12: Int; f13: Int; f14: Int; f15: Int; f16: Int }
asm fun sumS16(s: S16): Int { ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD ADD }

// Test 28: Incorrect ordering of primitive and TVM instruction arguments produced expected error
// asm fun orderError(): Int { PUSHINT 42 }

// Test 29: Valid asm function returning a struct Pair compiled successfully
struct Pair2 { a: Int; b: Int }
asm fun pairReturn(): Pair2 { 1 PUSHINT 2 PUSHINT }

// Test 30: Using 'mutates' attribute without 'extends' produced expected error
// asm mutates fun invalidMutates(): Int { 42 PUSHINT }

// Test 32: Attempting to directly use parameter name inside body produced expected error
// asm fun useParam(a: Int): Int { a ADD }

// Test 33: Attempting to directly use a raw stack register produced expected error
// asm fun useStackRef(): Int { s0 }

// Test 35: Increment test compiled successfully (expecting result 43 at runtime)
asm fun incTest(): Int { 42 PUSHINT 1 PUSHINT ADD }

// Test 36: Accessing out-of-range stack register produced expected error
// asm fun outOfRange(): Int { s256 }

// Test 37: Valid asm function returning a struct using a proper return arrangement compiled successfully
struct One { a: Int }
asm(-> 0) fun oneReturn(): One { 99 PUSHINT }

// Test 39: Testing nested struct flattening with potential ambiguity compiled successfully
struct A { x: Int }
struct B { a: A; x: Int }
asm fun testAmbiguity(b: B): Int { ADD }
