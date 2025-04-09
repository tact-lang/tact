// Test 2: Nested return in nested block
fun nested_return(a: Int): Int {
    if (a > 0) {
         { return a; }
    }
    return -a;
}
