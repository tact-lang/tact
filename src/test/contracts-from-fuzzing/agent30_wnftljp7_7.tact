contract ExplicitInit {
    init(a: Int) {
        // Explicit initialization using parameter a
    }
}

contract TestExplicit {
    receive() {
        // Using initOf for a contract with an explicit init() function
        let state = initOf ExplicitInit(10);
        // Using codeOf to get the code cell of ExplicitInit
        let code_cell = codeOf ExplicitInit;
    }
}
