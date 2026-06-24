fun testTernary() : Int {
    // Testing the ternary operator as described in documentation.
    // When condition is true: (true ? 10 : 20) should yield 10.
    let a: Int = true ? 10 : 20;
    // When condition is false: (false ? 10 : 20) should yield 20.
    let b: Int = false ? 10 : 20;
    
    // More compound ternary:
    // Condition: 10 > 20 (false), thus should pick the false branch expression: 15 + 5 = 20
    let c: Int = 10 > 20 ? (30 - 5) : (15 + 5);
    
    return a + b + c; // Expected result: 10 + 20 + 20 = 50
}

fun main() : Int {
    return testTernary();
}
