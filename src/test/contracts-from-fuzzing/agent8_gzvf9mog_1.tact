contract Target {
    init(a: Int) {
        // Initialization logic for Target
    }
}

contract Caller {
    // A simple function returning the code cell of Target's init package
    fun test() : Cell {
       let s: StateInit = initOf Target(42);
       return s.code;
    }
}
