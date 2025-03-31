struct Pair { first: Int; second: Int }

// 12. Testing combined argument and return arrangement
// With arrangement "asm(b a -> 1 0)", parameters are pushed in reversed order: [b, a].
// The MINMAX instruction then pops the top two values (top goes to second field and bottom to first field).
// For input (11, 22), reversed gives (22, 11), so MINMAX captures Pair { first: 22, second: 11 }.
asm(b a -> 1 0) fun revReturn(a: Int, b: Int): Pair { MINMAX }

// 13. Assembly function with no return type. This function leaves a value on the stack but does not capture it.
asm fun noReturn(x: Int) { 42 PUSHINT }

// 14. Assembly function with 'mutates' and 'extends' attributes.
// For extension functions, the first parameter must be named "self".
// This function increments the value in 'self' using the INC TVM instruction.
asm mutates extends fun mutateTest(self: Int): Int { INC }

// 15. Assembly function with the 'inline' attribute. Although asm functions are always inlined, this attribute is accepted.
asm inline fun inlineTest(): Int { 5 PUSHINT }

fun main() {
    // Test combined arrangement: expect Pair with first = 22, second = 11
    let p = revReturn(11, 22);

    // Test mutates function: increment 3 to 4 using extension function method call
    let y = 3.mutateTest();

    // Test inline function: should return 5
    let z = inlineTest();

    // Call noReturn function (its return is not captured)
    noReturn(999);

    // Sum values to use them (result is 22 + 11 + 4 + 5 = 42)
    let total = p.first + p.second + y + z;
}
