// Test 15: Testing an asm function that uses the 'extends' attribute without 'mutates' and ensure that it disallows usage of the 'mutates' attribute incorrectly
// Documentation states that assembly functions cannot use "virtual", "override", or "abstract". We already confirmed virtual misconception.

// We'll define an asm function as an extension function without mutates and ensure normal behavior.

asm extends fun extAdd(self: Int, other: Int): Int { ADD }

fun test_extAdd(): Int {
    return 5.extAdd(10);
}

fun main(): Int {
    return test_extAdd();
}
