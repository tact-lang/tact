contract LeftAssociativeTest {
    receive() {
        let a: Int = 3 - 4 - 5; // Expected: (3 - 4) - 5 = -6
    }
}
