/* Test 10: Valid calling of an asm function with 'extends mutates' as a method on an integer literal.
   Correct usage: call the inc method on an integer literal, expecting mutation semantics.
   Note that the result of (5).inc() should be computed by the assembly mutates function which returns the mutated value. */

asm extends mutates fun inc(self: Int): Int { 1 ADD }

fun testInc(): Int {
    return (5).inc();
}
