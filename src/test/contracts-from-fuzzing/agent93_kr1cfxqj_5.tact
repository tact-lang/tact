contract TestTernaryReturn {
    // This function uses the ternary operator in a return statement, which is expected to work correctly
    fun ternaryReturn(a: Int): Int {
         return a > 0 ? a : -a;
    }
}
