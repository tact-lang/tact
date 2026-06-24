contract DivTest {
    receive() {
        let a: Int = 3 / 2; // according to docs, should be 1 since division rounds toward -∞
        dump(a); // expected output is 1
        cashback(sender());
    }
}
