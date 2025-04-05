contract TestReturnCorrect {
    // Correct return statement inside a function with a non-void return type
    fun getNumber(): Int {
        return 42;
    }
    
    receive() {
        // Minimal receive function: does nothing
    }
}
