contract TestDivision {
    fun test() {
        // According to the documentation, 3 / 2 should be 1, since division rounds toward -∞
        let res: Int = 3 / 2;
        dump(res);
    }
    receive() {
        self.test();
        return;
    }
}
