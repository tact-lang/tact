fun testIfMissingSemicolon() {
    // Testing missing semicolon in if statement branches
    // According to the grammar, every statement should end with a semicolon.
    if (true) { 1 } else { 2 }
}

contract Tester {
    receive() {
        testIfMissingSemicolon();
    }
}
