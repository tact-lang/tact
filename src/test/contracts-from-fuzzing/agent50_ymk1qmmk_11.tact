fun nestedReturn2(x: Int): Int {
    repeat (2) {
        {
            if (x == 4) { return x * 3; }
        }
    }
    return x;
}

fun main() {
    dump(nestedReturn2(4)); // expecting 12
    dump(nestedReturn2(5)); // expecting 5
}
