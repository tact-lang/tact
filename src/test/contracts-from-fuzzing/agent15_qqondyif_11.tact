fun deepReturn(x: Int): Int {
    if (x > 0) {
        // Nested block with an inner condition
        {
            if (x > 100) {
                return 1000;
            } else {
                return x;
            }
        }
    }
    return 0;
}

fun main() {
    dump(deepReturn(50));   // Expected: 50
    dump(deepReturn(150));  // Expected: 1000
    dump(deepReturn(0));    // Expected: 0
}
