contract Test {
    fun nestedBlock(x: Int): Int {
        {
            if (x > 10) {
                return x;
            }
        }
        return 0;
    }

    receive() {}
}
