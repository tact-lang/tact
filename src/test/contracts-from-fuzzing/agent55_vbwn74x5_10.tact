contract TestMultiReturn {
    // Function with multiple return paths and nested blocks
    fun multiReturn(x: Int): Int {
        if (x < 0) {
            { return -1; } // nested block return for negative numbers
        } else if (x == 0) {
            { { return 0; } } // doubly nested block for zero
        } else {
            if (x > 100) { 
                return 100; // cap at 100
            }
            return x; // regular return
        }
    }
    
    receive () {}
}
