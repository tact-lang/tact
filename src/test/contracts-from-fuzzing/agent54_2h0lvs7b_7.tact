contract TestAssign {
    fun testAssign(n: Int): Int {
        let i: Int = 0;
        i = i + 1;
        return i;
    }
    receive () {}
}
