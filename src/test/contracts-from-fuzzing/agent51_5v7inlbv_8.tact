contract Crash {
    fun f(): Int {
        // Malformed if: missing parentheses in the condition
        if true { return 1; } else { return 0; }
    }
    
    receive() { }
}
