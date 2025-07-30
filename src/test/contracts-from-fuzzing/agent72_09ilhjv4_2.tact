fun nestedReturn(x: Int): Int {
    // Nested block with early return
    {
        if (x > 10) {
            return x;
        }
    }
    return 100;
}

fun main() {
    nestedReturn(5);
    nestedReturn(15);
}
