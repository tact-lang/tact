contract TestComplexReturnPaths {
    fun f(a: Int): Int {
        if(a > 10) {
            {
                // Nested block with explicit return
                if(a % 2 == 0) { 
                    return a + 1; 
                } else { 
                    return a - 1; 
                }
            }
        } else {
            repeat(3) {
                // If a simple condition holds, return from within loop
                if(a + 3 > 10) { 
                    return a + 3;
                }
            }
            return a + 100;
        }
    }
}
