// Test Case 1: Valid usage with a contract without parameters

contract A {
    receive() {}
}

contract TestValid01 {
    init() {
        // initOf returns the StateInit struct (with fields code and data)
        let si = initOf A();
        // codeOf returns the code cell of the contract
        let cc = codeOf A;
    }
    receive() {}
}
