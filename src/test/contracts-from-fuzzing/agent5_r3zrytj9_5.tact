fun testTrailingComma(a: Int, ) {
    // Testing a trailing comma in function parameter list
    let b = a;
}

contract Tester {
    receive() {
        testTrailingComma(42);
    }
}
