contract DivTest {
    receive() {
        // Division operator rounds toward -∞
        let a = 3 / 2;      // Expected: 1
        let b = -3 / 2;     // Expected: -2, because -1.5 rounded toward -∞ is -2
        require(a == 1, "Division error: 3/2 should be 1");
        require(b == -2, "Division error: -3/2 should be -2");
        cashback(sender());
    }
}
