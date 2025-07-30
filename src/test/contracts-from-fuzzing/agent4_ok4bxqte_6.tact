contract Test {
    fun nestedBlockReturn(x: Int): Int {
        {
            if (x > 0) { return x; }
        }
        return 0;
    }
    receive () {}
}
