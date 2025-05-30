contract TestNested {
    fun nested_return(x: Int): Int {
        {
            if (x > 10) {
                return 42;
            }
        }
        return x;
    }
}
