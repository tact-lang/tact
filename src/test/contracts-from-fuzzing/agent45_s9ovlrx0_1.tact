contract Test1 {
    
    // Regular function with early conditional returns
    receive () {}

    fun test1(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            return -x;
        }
    }
}
