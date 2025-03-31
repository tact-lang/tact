contract A {
    // Using implicit empty init()
    // No parameters
    init() { }
    
    // Simple receive function
    receive() {}
}

contract B {
    // This function returns the initial state of contract A
    fun getAInit() : StateInit {
        return initOf A();
    }
    
    receive() {}
}
