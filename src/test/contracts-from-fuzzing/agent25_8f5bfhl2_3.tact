/// Test 3: Testing parameter flattening and struct return capture in asm function

struct AB { a: Int; b: Int }

// This function adds the two flattened parameters
asm fun addAB(two: AB): Int { ADD }

fun main() {
    let res = addAB(AB{ a: 15, b: 27 });
    res;
}
