/// Test Case: Valid usage of initOf and codeOf on a contract with an explicit init() function having a trailing comma in its parameter list

contract B {
    init(param: Int, ) {
        // Initialization logic (empty for this test)
    }
    receive() {}
}

contract TestB {
    receive() {
        let s: StateInit = initOf B(123, );
        let c: Cell = codeOf B;
    }
}
