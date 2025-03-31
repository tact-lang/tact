contract Test {
    // Test 1: Regular function with early returns in if-else
    get fun regular1(a: Int) : Int {
         if (a > 0) {
             return a;
         } else {
             return -a;
         }
    }
}
