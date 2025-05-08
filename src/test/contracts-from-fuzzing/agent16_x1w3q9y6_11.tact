fun testOptionals(): Int {
    // Declare an optional integer with a non-null value
    let a: Int? = 5;
    // Declare an optional integer with a null value
    let b: Int? = null;
    
    // Check if 'a' is not null
    if (a != null) {
        // Access 'a' safely using non-null assertion
        let x: Int = a!!;
        // If 'b' is null, return one of two values based on a ternary choice on x
        if (b == null) {
            return x > 10 ? 100 : 200; // for x=5, should yield 200
        } else {
            return x;
        }
    } else {
        return 0;
    }
}

fun testTernary(x: Int): Int {
    // Ternary operator: return x if positive, otherwise -x
    return x > 0 ? x : -x;
}

fun main(): Int {
    let r1: Int = testOptionals();  // Expected: 200
    let r2: Int = testTernary(-7);    // Expected: 7
    dump(r1);
    dump(r2);
    return r1 + r2; // Expected total: 207
}
