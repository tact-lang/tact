contract Test {
    receive() {}
    
    fun add(): Int {
        // Testing simple addition of two integers
        return 1 + 2;
    }

    // Additional function calls to ensure all functions are compiled even if not called in receiver
    fun subtract(): Int {
        return 5 - 3;
    }
}

// A receiver function to call one of the functions to ensure they are compiled
// Although subtract is not directly referenced, add() sufficiently tests arithmetic operator
