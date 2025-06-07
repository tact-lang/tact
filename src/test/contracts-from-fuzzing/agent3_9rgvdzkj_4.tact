struct AB { a: Int; b: Int }

struct Nested { ab1: AB; ab2: AB }

// This asm function is intended to add the fields of the two AB structs to get separate sums then multiply them.
// Let's say for each AB, sum its fields and then multiply the sums.
// The function uses the TVM instructions: ADD, -ROT, ADD, MUL.
// The expected evaluation (from docs): For parameters in Nested, the fields are flattened in order.
// For Nested, the flattened order: ab1.a, ab1.b, ab2.a, ab2.b. So the stack order should be:
// bottom: ab1.a, then ab1.b, then ab2.a, top: ab2.b.
// The code does: ADD: adds top two: ab2.a and ab2.b -> second sum.
// then -ROT: moves the third element (ab1.b) to top 
// then ADD: adds ab1.a and ab1.b -> first sum.
// then MUL: multiplies the two sums.

asm fun mulOfSums(n: Nested): Int { ADD -ROT ADD MUL }

fun main(): Int {
    // Let's test with n: Nested { ab1: AB{ a: 1, b: 2 }, ab2: AB{ a: 3, b: 4 } }
    // Expected: (1+2) * (3+4) = 3 * 7 = 21
    return mulOfSums(Nested{ ab1: AB{ a: 1, b: 2 }, ab2: AB{ a: 3, b: 4 } });
}
