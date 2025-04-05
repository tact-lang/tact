contract TestOptionalComparison() {
    fun test() {
        // Testing optional comparison in an if-else statement
        let opt: Int? = null;
        if (opt != null) {
            dump(1);
        } else {
            dump(0);
        }
    }
    receive() {
        self.test();
    }
}
