/// Test parameter flattening with struct flattening
struct AB { a: Int; b: Int }

// This asm function expects a flattened struct (a and b), which will be pushed in order
asm fun sum(two: AB): Int { ADD }

fun main() {
    let result = sum(AB{ a: 40, b: 2 }); // Expected: 42
}
