contract Test {
    fun nestedReturn(x: Int): Int {
        {
            if (x > 10) { return 100; }
        }
        return 0;
    }
}
