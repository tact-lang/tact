fun nestedReturn(x: Int): Int {
    {
        if (x > 10) { return x; }
    }
    return 0;
}

fun main() {
    dump(nestedReturn(15)); // expect 15
    dump(nestedReturn(5));  // expect 0
}
