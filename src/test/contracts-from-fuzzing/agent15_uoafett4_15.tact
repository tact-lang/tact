contract OpPrecTest {
    receive() {
        let a = 1 + 2 * 3 - 4 / 2; // Expected: 1 + 6 - 2 = 5
        dump(a);
    }
}
