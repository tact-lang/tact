contract WeirdReturn {
    receive() {}
    
    // Function with nested blocks containing return statements
    fun weirdReturn(x: Int): Int {
        if (x < 0) {
            {
                if (true) {
                    return 55;
                }
            }
        }
        return 100;
    }
}
