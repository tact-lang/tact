/// Test 3: Parameter flattening using a struct
struct AB { a: Int; b: Int }

asm fun sumAB(two: AB): Int { a b ADD }

fun testSum() {
    let x = sumAB(AB { a: 10, b: 20 });
}
