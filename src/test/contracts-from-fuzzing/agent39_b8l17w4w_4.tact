contract Test4 {
    receive() {}
    fun nestedReturn(x: Int): Int {
        {
            if (x < 0) {
                return -1;
            }
        }
        return x * 2;
    }
}
