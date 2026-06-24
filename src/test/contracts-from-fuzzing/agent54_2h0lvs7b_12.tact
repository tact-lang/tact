contract TestReturnNoSemi {
    fun test(): Int {
        if (true) {
            return 5
        } else {
            return 10
        }
    }
    receive () {}
}
