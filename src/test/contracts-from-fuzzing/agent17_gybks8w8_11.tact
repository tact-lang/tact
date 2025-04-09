fun optReturn(x: Int): Int? {
    if (x > 0) {
        return x;
    }
    return null;
}

fun main() {
    dump(optReturn(10)); // Expected: 10 (wrapped in optional type representation)
    dump(optReturn(-5)); // Expected: null
}
