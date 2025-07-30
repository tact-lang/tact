trait X {
    fun foo(): Int { return 1; }
}

trait Y {
    fun foo(): Int { return 2; }
}

contract C() with X, Y {
    // Override the ambiguous method foo()
    override fun foo(): Int { 
        // Attempt to call trait methods - if direct calls are not allowed, use explicit trait resolution if possible
        // For now, simply return a sum to resolve ambiguity.
        return 1 + 2;
    }

    receive() { }
}
