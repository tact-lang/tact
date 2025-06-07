contract Test1 {
    // Test: Nested block return inside a function.
    fun nested_return(x: Int): Int {
        if (x == 0) {
            { 
                return 42;
            }
        }
        return x;
    }
}
