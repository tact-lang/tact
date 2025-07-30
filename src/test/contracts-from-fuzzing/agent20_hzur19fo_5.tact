/// Test 2: Flattening of simple struct parameters
struct AB { a: Int; b: Int }

// This asm function will add the two fields from the struct
asm fun sumAB(two: AB): Int { ADD }

fun main() {
    let two = AB { a: 27, b: 50 };
    sumAB(two)
}
