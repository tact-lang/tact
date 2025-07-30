contract TestNested {
    fun nestedReturn(x: Int): Int {
        {
            if (x > 10) {
                return x * 2;
            }
        }
        return x;
    }
}
