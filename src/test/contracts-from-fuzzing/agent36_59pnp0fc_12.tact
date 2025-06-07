struct Pair { a: Int; b: Int }

contract FuzzValid {
    // Function that uses a repeat loop with a nested if that returns early
    fun loopReturn(x: Int): Int {
        repeat(5) {
            if (x == 7) { return 100; }
        }
        do {
            // This do...until loop does nothing but simulate a block
        } until (x <= 1);
        let m: map<Int, Int> = emptyMap();
        foreach (k, v in m) {
            // Iterate over an empty map
        }
        return x;
    }

    // Function that uses destructuring assignment
    fun destructReturn(p: Pair): Int {
        let Pair { a, b } = p;
        return a + b;
    }

    // Function that tests augmented assignment on a local variable
    fun testAugAssign(x: Int): Int {
        let local: Int = x;
        local += 2;
        return local;
    }
}
