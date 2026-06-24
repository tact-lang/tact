contract TestOptionalsValid {
    fun test() {
        // Valid use of optionals: assign null then an Int, then use non-null assertion
        let opt: Int? = null;
        opt = 42;
        dump(opt!!); // should output 42
    }

    // Dummy receive to force inclusion
    receive() { cashback(sender()); }
}
