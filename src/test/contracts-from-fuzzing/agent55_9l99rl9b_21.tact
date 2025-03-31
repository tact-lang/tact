/* TestValid: Valid usage of initOf and codeOf expressions with a contract having no parameters */
contract A {
    init() {}
    receive() {
        // Compare myCode (current contract code) with codeOf expression for contract A
        let eq: Bool = myCode() == (codeOf A);
    }
}

contract TestValid {
    receive() {
        // Obtain the initial state of contract A
        let s: StateInit = initOf A();
    }
}
