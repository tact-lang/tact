/*
Extended Fuzz-Testing: Advanced Destructuring, Operator Associativity, and Bitwise Operations

This snippet tests several additional Tact language features beyond the basic ones:

1. DestructuringRenamingTest: Uses destructuring assignment with renaming of fields in a struct. Expected result: 6.
2. SubtractionAssociativityTest: Verifies left-associativity of the subtraction operator. Expected result: 0 (because (5 - 3) - 2 = 0).
3. BitwiseTest: Uses the bitwise left shift operator on integers (using the standard operator '<<') to left-shift 1 by 3 bits. Expected result: 8.
*/

struct Triple { a: Int; b: Int; c: Int }

fun sumTriple(t: Triple): Int {
    let Triple { a: first, b: second, c } = t;
    return first + second + c;
}

contract DestructuringRenamingTest {
    get fun test(): Int {
        return sumTriple(Triple { a: 1, b: 2, c: 3 }); // Expected: 6
    }
}

contract SubtractionAssociativityTest {
    get fun test(): Int {
        return 5 - 3 - 2; // Expected: 0
    }
}

contract BitwiseTest {
    get fun test(): Int {
        return 1 << 3; // Expected: 8 (using left shift operator, if supported)
    }
}
