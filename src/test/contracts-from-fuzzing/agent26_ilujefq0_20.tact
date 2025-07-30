fun testComplexOperators(): Int {
    // Testing complex operator precedence using arithmetic and bitwise operators
    let a: Int = 15;
    // Parenthesize to ensure intended order: add and subtract first, then multiply, then bitwise OR of the result with bitwise AND result
    let result: Int = ((a + 2) * (a - 3)) | ((a - 1) & 5);
    return result;
}

contract ComplexOperatorsTest {
    receive() {
         testComplexOperators();
    }
}
