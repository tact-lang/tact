contract Test {
    fun test() {
        if (true) {
            // empty true branch
        } else if true {
            // malformed: else if with missing parens
        }
    }
}