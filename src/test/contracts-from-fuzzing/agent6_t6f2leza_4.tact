struct AB { a: Int; b: Int }

// Test assembly function that adds two fields of AB from flattened parameters
asm fun sumAB(two: AB): Int { ADD }

fun main() {
    let res = sumAB(AB{ a: 27, b: 50 });
}
