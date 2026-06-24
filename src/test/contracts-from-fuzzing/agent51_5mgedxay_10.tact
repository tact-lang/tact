contract ParenthesesPrecedenceTest {
    receive() {
        let a: Int = 2 + 3 * 4;       // Expected: 2 + (3 * 4) = 14
        let b: Int = (2 + 3) * 4;     // Expected: (2 + 3) * 4 = 20
        let c: Bool = true || false && false; // Expected: true || (false && false) = true
    }
}
