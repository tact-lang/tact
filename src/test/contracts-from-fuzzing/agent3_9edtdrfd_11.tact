contract TestDivision {
    // This receiver computes 3/2 and checks that it equals 1 (floor division)
    receive() {
        let result = 3 / 2; // expected: 1, since division in Tact rounds toward -∞
        if (result != 1) {
            throw(1);
        }
        cashback(sender());
    }
}
