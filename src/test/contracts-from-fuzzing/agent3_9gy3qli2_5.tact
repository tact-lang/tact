extends fun inc(self: Int): Int {
    return self + 1;
}

contract TestInc {
    // This getter calls the extension function inc defined at module level
    get fun test(x: Int): Int {
        return x.inc();
    }
}
