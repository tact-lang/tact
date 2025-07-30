struct Pair { a: Int; b: Int }

// Adds two numbers from a flattened struct Pair (a is pushed first, b last, so stack: b, a)
// ADD pops s0 and s1 and pushes their sum
asm fun sumPair(pair: Pair): Int { ADD }

fun testSumPair() {
  let s: Int = sumPair(Pair{ a: 40, b: 2 });
}

struct Inner { x: Int; y: Int }
struct Outer { inner: Inner; z: Int }
// Flatten Outer: inner.x, inner.y, then z will be on stack as: s0: z, s1: inner.y, s2: inner.x
// Using two ADDs: first ADD adds z and inner.y, then ADD adds that result with inner.x
asm fun sumOuter(o: Outer): Int { ADD ADD }

fun testSumOuter() {
  let s: Int = sumOuter(Outer{ inner: Inner{ x: 10, y: 20 }, z: 5 });
}

// Test parameter arrangement: swap parameters. Declaration order: (x, y) but arranged as (y x).
// TVM instruction SUB subtracts s0 from s1 (i.e., second minus top) as per typical RPN convention.
asm(y x) fun subSwapped(x: Int, y: Int): Int { SUB }

fun testSubSwapped() {
  // With swapped parameters, the operation performed is: x - y becomes 50 - 8 if order not swapped, but here stack is swapped so it becomes 8 subtracted from 50? 
  // Actually, parameters: x=50, y=8, after arrangement, stack becomes [50, 8] swapped to [8, 50], then SUB yields 50-8 = 42.
  let r: Int = subSwapped(50, 8);
}

// Test return arrangement: swap the two pushed constants. Without arrangement, MyPair { first, second } would capture s1 and s0 respectively.
// Here, using asm(-> 1 0) the captured order is swapped: first field gets s0 and second gets s1. 
// Given: PUSHINT 10, then PUSHINT 42, so initially s0=42, s1=10. Arrangement swaps them, so captured as MyPair{ first=42, second=10 }.
struct MyPair { first: Int; second: Int }
asm(-> 1 0) fun pairSwap(): MyPair { PUSHINT 10 PUSHINT 42 }

fun testPairSwap() {
  let p: MyPair = pairSwap();
}

// Test that inline attribute is accepted even though asm functions are always inlined
asm inline fun inlineTest(): Int { 42 PUSHINT }

fun testInline() {
  let v: Int = inlineTest();
}

// Test parameter naming: parameter named DROP is accepted if not referenced in body
asm fun reservedParam(DROP: Int): Int { 42 PUSHINT }

fun testReservedParam() {
  let v: Int = reservedParam(99);
}
