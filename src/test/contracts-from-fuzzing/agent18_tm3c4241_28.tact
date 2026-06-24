contract MultiplePaths {
    fun test(x: Bool) : Int {
         if (x) { return 1; } else { return 0; }
    }

    receive() {}
}
