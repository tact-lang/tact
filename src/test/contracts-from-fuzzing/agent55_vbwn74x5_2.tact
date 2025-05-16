contract TestNestedReturn {
    // Test1: Nested block return in regular function
    fun nestedReturn(a: Int): Int {
        { 
            if (a > 10) {
                return a;
            }
        }
        return a + 1;
    }

    receive () {}
}
