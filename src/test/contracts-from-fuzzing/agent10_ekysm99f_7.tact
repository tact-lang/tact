// Test 5: Testing parameter flattening with a struct

struct AB { a: Int; b: Int }

// Assembly function that sums the two fields of an AB struct
asm fun sum(two: AB): Int { ADD }

fun main() {
    let result: Int = sum(AB{ a: 20, b: 22 });
    // Expected result: 42
}
