contract TestReturn1 {
    fun test() : Int {
        if (true) {
            return 1;
        } else {
            return 0;
        }
    }

    // Minimal receive for contract completion
    receive() {}
}