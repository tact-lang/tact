contract TestMultiReturnPaths {
    // Multiple return paths in nested conditionals
    fun test(flag: Bool): Int {
        if (flag) {
            return 1;
        } else if (!flag) {
            return 2;
        } else {
            // This path is never reached, but adds a default return
            return 3;
        }
    }

    // Nested return inside multiple blocks
    fun nestedReturn(): Int {
        let x: Int = 5;
        {
            let y: Int = 10;
            if (x + y > 12) {
                {
                    // Deeply nested block with an explicit return
                    return x * y;
                }
            }
        }
        return 0;
    }
}
