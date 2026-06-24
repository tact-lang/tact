fun earlyReturn(i: Int): Int {
    if (i > 10) {
        return i;
    }
    {
        let x = i + 1;
        if (x > 5) {
            return x;
        }
    }
    return 0;
}

// A simple entry point (if needed for contract execution, but not necessary for function testing)
fun main() {
    dump(earlyReturn(4));
    dump(earlyReturn(11));
}
