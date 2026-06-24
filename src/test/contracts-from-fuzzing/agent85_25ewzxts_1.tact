contract TestPrimitive() {
    fun test() {
        let a: Int = 3 / 2; // expected 1 because integer division rounds down (toward -∞)
        dump(a);
    }
}
