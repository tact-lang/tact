/// Snippet 1: Valid usage of initOf and codeOf on a contract without parameters

contract A {
    // A minimal contract with an explicit init function
    init() {}
    receive() {}
}

contract Test1 {
    // Function returning the StateInit struct for contract A
    fun testInit() : StateInit {
        // For a contract with no parameters, use empty parentheses
        let si: StateInit = initOf A( );
        return si;
    }

    // Function returning the code cell for contract A
    fun testCode() : Cell {
        let c: Cell = codeOf A;
        return c;
    }

    receive() {}
}
