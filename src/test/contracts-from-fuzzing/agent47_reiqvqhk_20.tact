contract FuzzEdgeCases {
    // Function with nested blocks and conditional early return
    fun nestedReturn(x: Int): Int {
        {
            {
                if (x > 5) {
                    return x * 2;
                }
            }
        }
        return x;
    }

    // Function with conditional return in if-else
    fun conditionalReturn(x: Int): Int {
        if (x < 0) {
            return -x;
        } else {
            let y: Int = x + 5;
            return y;
        }
    }

    // Function testing a block with optional trailing semicolon
    fun trailingSemicolonTest(): Int {
         let a: Int = 1;
         let b: Int = a * 10;
         return b
    }
}
