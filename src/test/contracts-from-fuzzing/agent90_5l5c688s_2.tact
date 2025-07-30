contract TestIntDivision {
    fun test() {
        let a: Int = 3 / 2; // Expected: 1, as division rounds downward toward -∞
        dump(a);
    }

    receive() {
        self.test();
    }
}
